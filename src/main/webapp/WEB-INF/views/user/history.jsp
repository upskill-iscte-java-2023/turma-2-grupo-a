<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Histórico</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/history.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.history.back()">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Histórico de viagens</p>
    <div class="content">
        <c:if test="${legs.isEmpty()}"><div class="card-warning">Não existem viagens realizadas!
            <div style="margin-top: 10px">Inicie uma viagem para guardá-la no seu histórico.</div></div></c:if>
        <c:forEach var="leg" items="${legs}">
            <div class="card-box">
                <form class="submit-button" id="myForm_${leg.getId()}" action="/travel_details" method="GET" >
                    <button class="card">
                        <input type="hidden" name="id" value="${leg.getId()}">
                        <div class="origin-box">
                        <div><svg xmlns="http://www.w3.org/2000/svg" width="15" height="16" viewBox="0 0 15 16" fill="none">
                            <mask id="mask0_854_705" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="15" height="16">
                                <path d="M0 0.5H15V15.5H0V0.5Z" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_854_705)">
                                <path d="M8.14063 14.2188V13.1771C8.59896 13.1146 9.04427 12.9931 9.47656 12.8125C9.90885 12.6319 10.3142 12.3958 10.6927 12.1042L11.4219 12.8646C10.9392 13.2569 10.4236 13.5651 9.875 13.7891C9.32639 14.013 8.74826 14.1563 8.14063 14.2188ZM12.349 11.9167L11.6094 11.1979C11.8872 10.8333 12.1163 10.4384 12.2969 10.013C12.4774 9.58767 12.6024 9.13194 12.6719 8.64583H13.7344C13.651 9.27778 13.4922 9.86892 13.2578 10.4193C13.0234 10.9696 12.7205 11.4688 12.349 11.9167ZM12.6719 7.35417C12.6024 6.86459 12.4774 6.40886 12.2969 5.98698C12.1163 5.56511 11.8872 5.17014 11.6094 4.80208L12.349 4.08333C12.7448 4.58333 13.0529 5.09722 13.2734 5.625C13.4939 6.15278 13.6476 6.72917 13.7344 7.35417H12.6719ZM6.83855 14.2188C5.2448 14.0382 3.91754 13.3576 2.85677 12.1771C1.79601 10.9965 1.26562 9.60417 1.26562 8C1.26562 6.39236 1.79601 4.99827 2.85677 3.8177C3.91754 2.63715 5.2448 1.95833 6.83855 1.78125V2.82291C5.53298 2.99999 4.45139 3.57811 3.59375 4.55728C2.7361 5.53646 2.30728 6.68403 2.30728 8C2.30728 9.31597 2.7361 10.4627 3.59375 11.4401C4.45139 12.4175 5.53298 12.9965 6.83855 13.1771V14.2188ZM10.7135 3.89583C10.3177 3.61458 9.90278 3.38368 9.46875 3.20313C9.03472 3.02256 8.59895 2.89582 8.16145 2.82291V1.78125C8.74132 1.85417 9.30903 2.0026 9.86458 2.22656C10.4201 2.45052 10.9392 2.75347 11.4219 3.13542L10.7135 3.89583ZM7.5 11.2396C6.88195 10.7153 6.29861 10.151 5.75 9.54688C5.20139 8.94271 4.92708 8.23958 4.92708 7.4375C4.92708 6.70833 5.17621 6.08507 5.67448 5.5677C6.17274 5.05035 6.78125 4.79167 7.5 4.79167C8.21875 4.79167 8.82726 5.05035 9.32552 5.5677C9.82379 6.08507 10.0729 6.70833 10.0729 7.4375C10.0729 8.23958 9.79862 8.94271 9.25 9.54688C8.70139 10.151 8.11805 10.7153 7.5 11.2396ZM7.5 8.02083C7.69445 8.02083 7.85851 7.95399 7.99219 7.82031C8.12586 7.68664 8.1927 7.52257 8.1927 7.32813C8.1927 7.15104 8.12586 6.99132 7.99219 6.84895C7.85851 6.7066 7.69445 6.63542 7.5 6.63542C7.30555 6.63542 7.14149 6.7066 7.00781 6.84895C6.87414 6.99132 6.8073 7.15104 6.8073 7.32813C6.8073 7.52257 6.87414 7.68664 7.00781 7.82031C7.14149 7.95399 7.30555 8.02083 7.5 8.02083Z" fill="#4D4C4C"/>
                            </g>
                        </svg> ${leg.getStart_address()}</div>
                        <div><svg xmlns="http://www.w3.org/2000/svg" width="15" height="16" viewBox="0 0 15 16" fill="none">
                            <mask id="mask0_854_710" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="15" height="16">
                                <rect y="0.5" width="15" height="15" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_854_710)">
                                <path d="M7.5 8C7.84375 8 8.13802 7.8776 8.38281 7.63281C8.6276 7.38802 8.75 7.09375 8.75 6.75C8.75 6.40625 8.6276 6.11198 8.38281 5.86719C8.13802 5.6224 7.84375 5.5 7.5 5.5C7.15625 5.5 6.86198 5.6224 6.61719 5.86719C6.3724 6.11198 6.25 6.40625 6.25 6.75C6.25 7.09375 6.3724 7.38802 6.61719 7.63281C6.86198 7.8776 7.15625 8 7.5 8ZM7.5 12.5938C8.77083 11.4271 9.71354 10.3672 10.3281 9.41406C10.9427 8.46094 11.25 7.61458 11.25 6.875C11.25 5.73958 10.888 4.8099 10.1641 4.08594C9.4401 3.36198 8.55208 3 7.5 3C6.44792 3 5.5599 3.36198 4.83594 4.08594C4.11198 4.8099 3.75 5.73958 3.75 6.875C3.75 7.61458 4.05729 8.46094 4.67188 9.41406C5.28646 10.3672 6.22917 11.4271 7.5 12.5938ZM7.5 14.25C5.82292 12.8229 4.57031 11.4974 3.74219 10.2734C2.91406 9.04948 2.5 7.91667 2.5 6.875C2.5 5.3125 3.0026 4.06771 4.00781 3.14063C5.01302 2.21354 6.17708 1.75 7.5 1.75C8.82292 1.75 9.98698 2.21354 10.9922 3.14063C11.9974 4.06771 12.5 5.3125 12.5 6.875C12.5 7.91667 12.0859 9.04948 11.2578 10.2734C10.4297 11.4974 9.17708 12.8229 7.5 14.25Z" fill="#4D4C4C"/>
                            </g>
                        </svg> ${leg.getEnd_address()}</div>
                        </div>
                        <div class="time-travel-box">
                            <div class="travel-box">
                                <c:forEach var="step" items="${leg.getSteps()}" varStatus="loop">
                                    <c:if test="${step.getTravel_mode().equals('WALKING')}">
                                        <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                    </c:if>
                                    <c:if test="${!step.getTravel_mode().equals('WALKING')}">
                                        <div class="icon-box"><img class="icon" src="${step.getIcon()}"></div>
                                        <div class="travel-text"
                                             style="background-color: ${step.getLine().getColor()}; color: ${step.getLine().getText_color()}">
                                            <span style="margin: 0 2px">${step.getLine().getName()}</span></div>
                                    </c:if>
                                    <c:if test="${!loop.last}">
                                        <div class="icon-box">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="11"
                                                 viewBox="0 0 7 11" fill="none">
                                                <path d="M4.33562 5.54835L0.502289 1.71502L1.66896 0.548355L6.66896 5.54835L1.66896 10.5484L0.502289 9.38169L4.33562 5.54835Z"
                                                      fill="#3C4043"/>
                                            </svg>
                                        </div>
                                    </c:if>
                                </c:forEach></div>
                            <div class="time-box"><strong>${leg.getDuration()}</strong></div>
                        </div>
                        <div class="time-travel-box">
                            <div class="start-end-box">${leg.getDeparture_time()}<span
                                    style="margin: 0 3px"> - </span>${leg.getArrival_time()}</div>
                            <div class="fare-box"><span
                                    class="fare-style">VIAS Card: </span> ${leg.getFare()}<span>€</span>
                            </div>
                        </div>
                        <div class="points-box">
                            <img src="/images/vias_league.v3.png" width="55px" height="30px" alt="Logo da VIAS League">
                            <span>Pontos acumulados: ${leg.getPoints()}</span>
                        </div>
                    </button>
                </form>
            </div>
        </c:forEach>

    </div>
</div>

    <div class="footerlogo" onclick=window.location.href='/home'>
        <footer>
            <div class="footerimage" style="margin-top: 12px">
                <svg width="115" height="25" viewBox="0 0 196 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18.24 45L-0.896 0.199997H12.8L28.928 38.984H20.864L37.376 0.199997H49.92L30.72 45H18.24ZM52.5425 45V0.199997H65.2145V45H52.5425ZM68.854 45L88.63 0.199997H101.11L120.95 45H107.766L92.278 6.408H97.27L81.782 45H68.854ZM79.67 36.296L82.934 26.952H104.822L108.086 36.296H79.67Z" fill="white"/>
                    <path d="M177.001 24.6667L176.998 43.3333L196 38.0027L190.46 34.1147C193.142 30.656 194.643 26.408 194.64 22C194.64 10.9733 185.51 1.99999 174.284 1.99999C158.892 1.99999 155.246 16.3226 154.049 21.032C151.3 31.832 147.294 34 141.714 34C134.98 34 129.5 28.616 129.5 22C129.5 19.272 130.482 16.664 132.189 14.5547L138.999 19.3333V0.666656L120 5.99999L125.54 9.88532C122.858 13.344 121.357 17.592 121.357 22C121.357 33.0293 130.488 42 141.714 42C155.512 42 159.869 31.1413 161.948 22.968C164.849 11.5733 169.591 9.99999 174.284 9.99999C181.018 9.99999 186.498 15.3867 186.498 22.0054C186.5 24.7307 185.518 27.3387 183.811 29.448L177.001 24.6667Z" fill="#A3DD41"/>
                </svg>
            </div>
        </footer>
    </div>

</body>
</html>