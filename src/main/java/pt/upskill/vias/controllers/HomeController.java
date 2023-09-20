package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.services.viasleague.SimulateTripService;
import pt.upskill.vias.services.viasleague.ViasLeagueService;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.HomeService;
import pt.upskill.vias.services.routes.RoutesRequestService;
import pt.upskill.vias.services.routes.info.JSONConversionService;

import java.io.IOException;
import java.security.Principal;
import java.util.List;


@Controller
public class HomeController {

    @Autowired
    HomeService homeService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoutesRequestService routesRequestService;

    @Autowired
    LegRepository legRepository;

    @Autowired
    JSONConversionService jsonConversionService;

    @Autowired
    SimulateTripService simulateTripService;

    @Autowired
    ViasLeagueService viasLeagueService;

    @GetMapping("/home")
    public ModelAndView homePage(Principal principal) {
        ModelAndView mav = new ModelAndView("home");

        if (principal != null) {
            String loggedInUsername = principal.getName();
            mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
        }


        return mav;
    }

    @GetMapping(value="/")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView("welcome");
        return mav;
    }


    @PostMapping(value="/perform_travel")
    public ModelAndView performTravel(String origem, String destino, Principal principal) throws IOException {
        ModelAndView mav = new ModelAndView("suggestions");
        List<Leg> legs = routesRequestService.getLegList(origem, destino);


        legRepository.saveAll(legs);

        if (legs.isEmpty()) {
            mav.addObject("error2", "Erro na procura. \nPor favor, tente outros locais.");
            return mav;
        }

        if(principal != null){
            User user = userRepository.getUserByUsername(principal.getName());
            mav.addObject("user", user);
            simulateTripService.saveLegsToUser(user, legs);
        }

        mav.addObject("legs", legs);
        return mav;

    }

    @PostMapping(value = "/traveldetails")
    public ModelAndView travelDetailsPage(@RequestParam("id") long id, Principal principal) {
        ModelAndView mav = new ModelAndView("traveldetails");

        Leg leg = legRepository.getLegById(id);
        leg = jsonConversionService.addSteps(leg);
        mav.addObject("leg", leg);

        if(principal != null){
            User user = userRepository.getUserByUsername(principal.getName());
            mav.addObject("user", user);
        }

        return mav;
    }

    @PostMapping(value = "/simulate_trip")
    public ModelAndView simulateTripRequest(@RequestParam("id")long legId, Principal principal) {
        ModelAndView mav = new ModelAndView("traveldetails");


        User user = userRepository.getUserByUsername(principal.getName());
        long userId = user.getId();

        //ADICIONAR MENSAGEM DE OK

        Leg leg = legRepository.getLegById(legId);
        leg = jsonConversionService.addSteps(leg);
        mav.addObject("leg", leg);

        simulateTripService.simulateTrip(userId, legId);

        return mav;
    }


}
