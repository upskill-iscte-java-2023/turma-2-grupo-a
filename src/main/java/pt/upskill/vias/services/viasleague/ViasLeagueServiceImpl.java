package pt.upskill.vias.services.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.LastUpdate;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.entities.user.UserStats;
import pt.upskill.vias.repositories.LastUpdateRepository;
import pt.upskill.vias.repositories.LeagueRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.UserStatsRepository;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ViasLeagueServiceImpl implements ViasLeagueService {

    @Autowired
    UserStatsRepository userStatsRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    LeagueRepository leagueRepository;

    @Autowired
    LastUpdateRepository lastUpdateRepository;


    @Override
    public void updateUserStats(User user, Leg leg) {
        UserStats userStats = user.getUser_stats();
        List<Step> steps = leg.getSteps();

        int total_distance_walking = userStats.getTotal_distance_walking() + getLegDistanceWalking(steps);
        int total_distance_transit = (userStats.getTotal_distance_transit() + getLegDistanceTransit(steps)) / 1000;
        int total_time_walking = userStats.getTotal_time_walking() + getLegTimeWalking(steps) / 60;
        int total_time_transit = userStats.getTotal_time_transit() + getLegTimeTransit(steps) / 60;
        int legPoints = leg.getPoints();
        int trips_done = userStats.getTrips_done() + 1;
        int total_points = userStats.getTotal_points() + legPoints;
        int weekly_points = userStats.getWeekly_points() + legPoints;

        userStats.setTotal_distance_walking(total_distance_walking);
        userStats.setTotal_distance_transit(total_distance_transit);
        userStats.setTotal_time_walking(total_time_walking);
        userStats.setTotal_time_transit(total_time_transit);
        userStats.setTrips_done(trips_done);
        userStats.setTotal_points(total_points);
        userStats.setWeekly_points(weekly_points);

        userStatsRepository.save(userStats);
    }

    @Override
    public int getLegDistanceWalking(List<Step> steps) {
        int distance = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("WALKING")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegDistanceTransit(List<Step> steps) {
        int distance = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("TRANSIT")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegTimeWalking(List<Step> steps) {
        int time = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("WALKING")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public int getLegTimeTransit(List<Step> steps) {
        int time = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("TRANSIT")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public List<User> getStatsByFilter(String filter, League league) {

        List<User> userList = userRepository.findActiveUsers();

        switch (filter) {
            case "Distância Percorrida a Andar":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTotal_distance_walking()));
                break;
            case "Distância Percorrida Transportes":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTotal_distance_transit()));
                break;
            case "Tempo Despendido a Andar":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTotal_time_walking()));
                break;
            case "Tempo Despendido Transportes":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTotal_time_transit()));
                break;
            case "Viagens Completas":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTrips_done()));
                break;
            case "Global League":
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getTotal_points()));
                break;
            case "My League":
                userList = userRepository.findByCurrentLeagueId(league.getId());
                userList.sort(Comparator.comparingInt(u -> -u.getUser_stats().getWeekly_points()));
                break;
            default:
                return Collections.emptyList();
        }

        return userList;
    }

    @Override
    @Transactional
    @Scheduled(cron = "0 0 0 * * MON", zone = "Europe/Lisbon")
    public void resetLeague() {
        LastUpdate last_update = lastUpdateRepository.getLastUpdateById(1);

        changeLeagues();
        resetStats(userRepository.findAll());

        last_update.setDate(new Date());
        lastUpdateRepository.save(last_update);
    }

    @Override
    public void resetStats(List<User> users) {
        for (User user : users) {
            user.getUser_stats().setWeekly_points(0);
            userRepository.save(user);
        }
    }

    public void changeUsersLeague(List<User> leagueUsers, int positions_to_move, int currentLeagueId, int nextLeagueId, Comparator<? super User> c) {
        leagueUsers.sort(c);
        for (int i = 0; i < leagueUsers.size(); i++) {
            User user = leagueUsers.get(i);
            user.setPrevious_league(leagueRepository.getLeagueById(currentLeagueId));
            if (i < positions_to_move) {
                user.setCurrent_league(leagueRepository.getLeagueById(nextLeagueId));
            }
            userRepository.save(user);
        }
    }

    @Override
    public void changeLeagues() {
        int positions_to_move = 3;

        List<User> diamond = userRepository.findByCurrentLeagueId(5);
        List<User> platinum = userRepository.findByCurrentLeagueId(4);
        List<User> gold = userRepository.findByCurrentLeagueId(3);
        List<User> silver = userRepository.findByCurrentLeagueId(2);
        List<User> bronze = userRepository.findByCurrentLeagueId(1);

        changeDiamond(diamond, positions_to_move);
        changePlatinum(platinum, positions_to_move);
        changeGold(gold, positions_to_move);
        changeSilver(silver, positions_to_move);
        changeBronze(bronze, positions_to_move);
    }

    public void changeDiamond(List<User> diamond, int positions_to_move) {
        int size = diamond.size();
        Comparator<User> demotionComparator = Comparator.comparingInt(u -> u.getUser_stats().getWeekly_points());

        if (size > positions_to_move * 2) {
            changeUsersLeague(diamond, positions_to_move, 5, 4, demotionComparator);
        } else if (size > 1) {
            int demotions = size / 2;
            changeUsersLeague(diamond, demotions, 5, 4, demotionComparator);
        } else if (size == 1) {
            User user = diamond.get(0);
            user.setPrevious_league(leagueRepository.getLeagueById(4));
            userRepository.save(user);
        }
    }

    public void changePlatinum(List<User> platinum, int positions_to_move) {
        int size = platinum.size();
        Comparator<User> demotionComparator = Comparator.comparingInt(u -> u.getUser_stats().getWeekly_points());
        Comparator<User> promotionComparator = Comparator.comparingInt(u -> -u.getUser_stats().getWeekly_points());

        if (size > positions_to_move * 2) {
            changeUsersLeague(platinum, positions_to_move, 4, 3, demotionComparator);
            changeUsersLeague(platinum, positions_to_move, 4, 5, promotionComparator);
        } else if (size > 2) {
            changeUsersLeague(platinum, 1, 4, 3, demotionComparator);
            changeUsersLeague(platinum, 1, 4, 5, promotionComparator);
        } else if (size > 0) {
            for (User user : platinum) {
                user.setPrevious_league(leagueRepository.getLeagueById(4));
                userRepository.save(user);
            }
        }
    }


    public void changeGold(List<User> gold, int positions_to_move) {
        int size = gold.size();
        Comparator<User> demotionComparator = Comparator.comparingInt(u -> u.getUser_stats().getWeekly_points());
        Comparator<User> promotionComparator = Comparator.comparingInt(u -> -u.getUser_stats().getWeekly_points());

        if (size > positions_to_move * 2) {
            changeUsersLeague(gold, positions_to_move, 3, 2, demotionComparator);
            changeUsersLeague(gold, positions_to_move, 3, 4, promotionComparator);
        } else if (size > 2) {
            changeUsersLeague(gold, 1, 3, 2, demotionComparator);
            changeUsersLeague(gold, 1, 3, 4, promotionComparator);
        } else if (size > 0) {
            for (User user : gold) {
                user.setPrevious_league(leagueRepository.getLeagueById(3));
                userRepository.save(user);
            }
        }
    }


    public void changeSilver(List<User> silver, int positions_to_move) {
        int size = silver.size();
        Comparator<User> demotionComparator = Comparator.comparingInt(u -> u.getUser_stats().getWeekly_points());
        Comparator<User> promotionComparator = Comparator.comparingInt(u -> -u.getUser_stats().getWeekly_points());

        if (size > positions_to_move * 2) {
            changeUsersLeague(silver, positions_to_move, 2, 1, demotionComparator);
            changeUsersLeague(silver, positions_to_move, 2, 3, promotionComparator);
        } else if (size > 2) {
            changeUsersLeague(silver, 1, 2, 1, demotionComparator);
            changeUsersLeague(silver, 1, 2, 3, promotionComparator);
        } else if (size > 0) {
            for (User user : silver) {
                user.setPrevious_league(leagueRepository.getLeagueById(2));
                userRepository.save(user);
            }
        }
    }

    public void changeBronze(List<User> bronze, int positions_to_move) {
        int size = bronze.size();
        Comparator<User> promotionComparator = Comparator.comparingInt(u -> -u.getUser_stats().getWeekly_points());

        if (size > positions_to_move * 2) {
            changeUsersLeague(bronze, positions_to_move, 1, 2, promotionComparator);
        } else if (size > 1) {
            int promotion = size / 2;
            changeUsersLeague(bronze, promotion, 1, 2, promotionComparator);
        } else if (size == 1) {
            User user = bronze.get(0);
            user.setPrevious_league(leagueRepository.getLeagueById(1));
            userRepository.save(user);
        }
    }

    public String nextUpdate() {
        Date last_update = lastUpdateRepository.getLastUpdateById(1).getDate();
        long sevenDaysInMillis = 7L * 24 * 60 * 60 * 1000;
        Date next_update = new Date(last_update.getTime() + sevenDaysInMillis);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        return sdf.format(next_update);
    }
}
