<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
    <title>VIAS | Sugestões de rota</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/suggestions.css">
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs"></script>--%>

</head>
<body class="home-body" onload="initMap()">
<button class="arrowbutton" style="z-index: 1000" onclick=window.location.href='/home';>
    <img src="/images/backarrow.png" alt="Go back!" width="30px">
</button>
<div class="home-container">
    <div class="mapbox">


            <div id="map" ></div>

    </div>

    <div class="suggestions-content">
        <div class="imageDesktop">
            <footer>
                <img class="imageTopLeft" src="images/logo_nobg.png" alt="">
            </footer>
        </div>
        <div class="button-box">
            <button class="button" style="font-size: 14px"><svg style="margin:auto 7px auto" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 40" fill="none">
                <mask id="mask0_27_208" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40" height="40">
                    <path d="M0 0H40V40H0V0Z" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_27_208)">
                    <path d="M21.7083 36.5834V33.8056C22.9306 33.6389 24.1181 33.3149 25.2708 32.8334C26.4236 32.3519 27.5046 31.7223 28.5139 30.9445L30.4583 32.9722C29.1713 34.0185 27.7963 34.8403 26.3333 35.4375C24.8704 36.0347 23.3287 36.4167 21.7083 36.5834ZM32.9305 30.4445L30.9583 28.5278C31.6991 27.5556 32.3102 26.5023 32.7917 25.3681C33.2732 24.2338 33.6065 23.0185 33.7917 21.7222H36.625C36.4028 23.4074 35.9792 24.9838 35.3542 26.4514C34.7292 27.919 33.9213 29.25 32.9305 30.4445ZM33.7917 18.2778C33.6065 16.9723 33.2732 15.757 32.7917 14.632C32.3102 13.507 31.6991 12.4537 30.9583 11.4722L32.9305 9.55556C33.9861 10.8889 34.8079 12.2593 35.3958 13.6667C35.9838 15.0741 36.3935 16.6111 36.625 18.2778H33.7917ZM18.2361 36.5834C13.9861 36.1019 10.4468 34.2871 7.61804 31.1389C4.78935 27.9908 3.375 24.2778 3.375 20C3.375 15.713 4.78935 11.9954 7.61804 8.84723C10.4468 5.69909 13.9861 3.88891 18.2361 3.41669V6.19444C14.7546 6.66666 11.8704 8.20833 9.58333 10.8194C7.29628 13.4306 6.15275 16.4908 6.15275 20C6.15275 23.5093 7.29628 26.5671 9.58333 29.1736C11.8704 31.7801 14.7546 33.3241 18.2361 33.8056V36.5834ZM28.5695 9.05556C27.5139 8.30556 26.4074 7.68983 25.25 7.20835C24.0926 6.72685 22.9305 6.38888 21.7639 6.19444V3.41669C23.3102 3.61113 24.8241 4.00696 26.3055 4.60419C27.787 5.20141 29.1713 6.00928 30.4583 7.02781L28.5695 9.05556ZM20 28.6389C18.3519 27.2408 16.7963 25.7361 15.3333 24.125C13.8704 22.5139 13.1389 20.6389 13.1389 18.5C13.1389 16.5556 13.8032 14.8935 15.132 13.5139C16.4607 12.1343 18.0833 11.4445 20 11.4445C21.9167 11.4445 23.5393 12.1343 24.868 13.5139C26.1968 14.8935 26.8611 16.5556 26.8611 18.5C26.8611 20.6389 26.1296 22.5139 24.6667 24.125C23.2037 25.7361 21.6481 27.2408 20 28.6389ZM20 20.0556C20.5185 20.0556 20.956 19.8773 21.3125 19.5209C21.669 19.1644 21.8472 18.7269 21.8472 18.2084C21.8472 17.7361 21.669 17.3102 21.3125 16.9306C20.956 16.551 20.5185 16.3611 20 16.3611C19.4815 16.3611 19.044 16.551 18.6875 16.9306C18.331 17.3102 18.1528 17.7361 18.1528 18.2084C18.1528 18.7269 18.331 19.1644 18.6875 19.5209C19.044 19.8773 19.4815 20.0556 20 20.0556Z" fill="white"/>
                </g>
            </svg><span style="margin: auto auto auto 0">${legs.get(0).getStart_address()}</span></button>
            <button class="button" style="font-size: 14px">
                <svg style="margin:auto 7px auto" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 40" fill="none">
                    <mask id="mask0_27_251" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40" height="40">
                        <rect width="40" height="40" fill="#D9D9D9"/>
                    </mask>
                    <g mask="url(#mask0_27_251)">
                        <path d="M20 20C20.9166 20 21.7013 19.6736 22.3541 19.0208C23.0069 18.368 23.3333 17.5833 23.3333 16.6666C23.3333 15.75 23.0069 14.9653 22.3541 14.3125C21.7013 13.6597 20.9166 13.3333 20 13.3333C19.0833 13.3333 18.2986 13.6597 17.6458 14.3125C16.993 14.9653 16.6666 15.75 16.6666 16.6666C16.6666 17.5833 16.993 18.368 17.6458 19.0208C18.2986 19.6736 19.0833 20 20 20ZM20 32.25C23.3888 29.1389 25.9027 26.3125 27.5416 23.7708C29.1805 21.2291 30 18.9722 30 17C30 13.9722 29.0347 11.493 27.1041 9.56248C25.1736 7.63192 22.8055 6.66665 20 6.66665C17.1944 6.66665 14.8263 7.63192 12.8958 9.56248C10.9652 11.493 9.99996 13.9722 9.99996 17C9.99996 18.9722 10.8194 21.2291 12.4583 23.7708C14.0972 26.3125 16.6111 29.1389 20 32.25ZM20 36.6666C15.5277 32.8611 12.1875 29.3264 9.97913 26.0625C7.77079 22.7986 6.66663 19.7778 6.66663 17C6.66663 12.8333 8.0069 9.51387 10.6875 7.04165C13.368 4.56942 16.4722 3.33331 20 3.33331C23.5277 3.33331 26.6319 4.56942 29.3125 7.04165C31.993 9.51387 33.3333 12.8333 33.3333 17C33.3333 19.7778 32.2291 22.7986 30.0208 26.0625C27.8125 29.3264 24.4722 32.8611 20 36.6666Z" fill="white"/>
                    </g>
                </svg><span style="margin: auto auto auto 0 ">${legs.get(0).getEnd_address()}</span></button>
           <%-- <div class="date-hour-box" style="margin-top: 20px;">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <mask id="mask0_189_1662" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                                  width="24" height="24">
                                <rect width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_189_1662)">
                                <path d="M6.79042 22C6.19761 22 5.69012 21.8042 5.26797 21.4125C4.84581 21.0208 4.63474 20.55 4.63474 20V6C4.63474 5.45 4.84581 4.97917 5.26797 4.5875C5.69012 4.19583 6.19761 4 6.79042 4H7.86827V2H10.024V4H18.6467V2H20.8024V4H21.8802C22.4731 4 22.9805 4.19583 23.4027 4.5875C23.8249 4.97917 24.0359 5.45 24.0359 6V20C24.0359 20.55 23.8249 21.0208 23.4027 21.4125C22.9805 21.8042 22.4731 22 21.8802 22H6.79042ZM6.79042 20H21.8802V10H6.79042V20ZM6.79042 8H21.8802V6H6.79042V8ZM14.3353 14C14.0299 14 13.774 13.9042 13.5674 13.7125C13.3608 13.5208 13.2575 13.2833 13.2575 13C13.2575 12.7167 13.3608 12.4792 13.5674 12.2875C13.774 12.0958 14.0299 12 14.3353 12C14.6407 12 14.8967 12.0958 15.1033 12.2875C15.3099 12.4792 15.4132 12.7167 15.4132 13C15.4132 13.2833 15.3099 13.5208 15.1033 13.7125C14.8967 13.9042 14.6407 14 14.3353 14ZM10.024 14C9.71857 14 9.46258 13.9042 9.25599 13.7125C9.04941 13.5208 8.94611 13.2833 8.94611 13C8.94611 12.7167 9.04941 12.4792 9.25599 12.2875C9.46258 12.0958 9.71857 12 10.024 12C10.3293 12 10.5853 12.0958 10.7919 12.2875C10.9985 12.4792 11.1018 12.7167 11.1018 13C11.1018 13.2833 10.9985 13.5208 10.7919 13.7125C10.5853 13.9042 10.3293 14 10.024 14ZM18.6467 14C18.3413 14 18.0853 13.9042 17.8787 13.7125C17.6722 13.5208 17.5689 13.2833 17.5689 13C17.5689 12.7167 17.6722 12.4792 17.8787 12.2875C18.0853 12.0958 18.3413 12 18.6467 12C18.9521 12 19.2081 12.0958 19.4147 12.2875C19.6213 12.4792 19.7246 12.7167 19.7246 13C19.7246 13.2833 19.6213 13.5208 19.4147 13.7125C19.2081 13.9042 18.9521 14 18.6467 14ZM14.3353 18C14.0299 18 13.774 17.9042 13.5674 17.7125C13.3608 17.5208 13.2575 17.2833 13.2575 17C13.2575 16.7167 13.3608 16.4792 13.5674 16.2875C13.774 16.0958 14.0299 16 14.3353 16C14.6407 16 14.8967 16.0958 15.1033 16.2875C15.3099 16.4792 15.4132 16.7167 15.4132 17C15.4132 17.2833 15.3099 17.5208 15.1033 17.7125C14.8967 17.9042 14.6407 18 14.3353 18ZM10.024 18C9.71857 18 9.46258 17.9042 9.25599 17.7125C9.04941 17.5208 8.94611 17.2833 8.94611 17C8.94611 16.7167 9.04941 16.4792 9.25599 16.2875C9.46258 16.0958 9.71857 16 10.024 16C10.3293 16 10.5853 16.0958 10.7919 16.2875C10.9985 16.4792 11.1018 16.7167 11.1018 17C11.1018 17.2833 10.9985 17.5208 10.7919 17.7125C10.5853 17.9042 10.3293 18 10.024 18ZM18.6467 18C18.3413 18 18.0853 17.9042 17.8787 17.7125C17.6722 17.5208 17.5689 17.2833 17.5689 17C17.5689 16.7167 17.6722 16.4792 17.8787 16.2875C18.0853 16.0958 18.3413 16 18.6467 16C18.9521 16 19.2081 16.0958 19.4147 16.2875C19.6213 16.4792 19.7246 16.7167 19.7246 17C19.7246 17.2833 19.6213 17.5208 19.4147 17.7125C19.2081 17.9042 18.9521 18 18.6467 18Z"
                                      fill="#041F48"/>
                            </g>
                        </svg>
                        Hoje
                    </button>
                    <button type="button" class="btn btn-secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <mask id="mask0_189_1667" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                                  width="24" height="24">
                                <rect width="24" height="24" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_189_1667)">
                                <path d="M10.7784 22C9.28743 22 7.88623 21.7375 6.57485 21.2125C5.26347 20.6875 4.12275 19.975 3.15269 19.075C2.18263 18.175 1.41467 17.1167 0.848802 15.9C0.282934 14.6833 0 13.3833 0 12C0 10.6167 0.282934 9.31667 0.848802 8.1C1.41467 6.88333 2.18263 5.825 3.15269 4.925C4.12275 4.025 5.26347 3.3125 6.57485 2.7875C7.88623 2.2625 9.28743 2 10.7784 2C12.2695 2 13.6707 2.2625 14.982 2.7875C16.2934 3.3125 17.4341 4.025 18.4042 4.925C19.3743 5.825 20.1422 6.88333 20.7081 8.1C21.274 9.31667 21.5569 10.6167 21.5569 12C21.5569 12.45 21.5299 12.8917 21.4761 13.325C21.4222 13.7583 21.3323 14.1833 21.2066 14.6C20.9551 14.3333 20.6632 14.1083 20.3308 13.925C19.9985 13.7417 19.6347 13.6167 19.2395 13.55C19.2934 13.3 19.3338 13.0458 19.3608 12.7875C19.3877 12.5292 19.4012 12.2667 19.4012 12C19.4012 9.76667 18.5659 7.875 16.8952 6.325C15.2246 4.775 13.1856 4 10.7784 4C8.37126 4 6.33234 4.775 4.66168 6.325C2.99102 7.875 2.15569 9.76667 2.15569 12C2.15569 14.2333 2.99102 16.125 4.66168 17.675C6.33234 19.225 8.37126 20 10.7784 20C11.6946 20 12.5704 19.875 13.4057 19.625C14.241 19.375 15.009 19.025 15.7096 18.575C15.9252 18.8583 16.1901 19.1083 16.5045 19.325C16.8189 19.5417 17.1557 19.7083 17.515 19.825C16.5988 20.5083 15.5704 21.0417 14.4296 21.425C13.2889 21.8083 12.0719 22 10.7784 22ZM18.5928 18C18.2156 18 17.8967 17.8792 17.6362 17.6375C17.3758 17.3958 17.2455 17.1 17.2455 16.75C17.2455 16.4 17.3758 16.1042 17.6362 15.8625C17.8967 15.6208 18.2156 15.5 18.5928 15.5C18.9701 15.5 19.2889 15.6208 19.5494 15.8625C19.8099 16.1042 19.9401 16.4 19.9401 16.75C19.9401 17.1 19.8099 17.3958 19.5494 17.6375C19.2889 17.8792 18.9701 18 18.5928 18ZM14.3353 16.7L9.7006 12.4V7H11.8563V11.6L15.8443 15.3L14.3353 16.7Z"
                                      fill="#041F48"/>
                            </g>
                        </svg>
                        Agora
                    </button>
                </div>
            </div>--%>
        </div>

        <c:if test="${search_error != null}">

            <div class="alert alert-danger text-center">
                <p>${search_error}</p>
                <div class="d-flex justify-content-center align-items-center">
                    <button class="btn btn-light" onclick="window.location.href='/home'">OK</button>
                </div>
            </div>
        </c:if>
        <c:if test="${search_error == null}">

            <div class="suggestions-box">
                <h4>Sugestões de Rota</h4>
                    <%--<c:if test="${search_error != null}">
                        <div class="alert alert-danger">
                                ${search_error}
                        </div>
                    </c:if>--%>
                <c:forEach var="leg" items="${legs}">
                    <div class="card-box">
                        <form class="submit-button" id="myForm_${leg.getId()}" action="/travel_details" method="post" >
                        <button class="card">
                                <input type="hidden" name="id" value="${leg.getId()}">
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
                        </button>
                        </form>
                        <div class="card-button" onclick="window.location.href='/wallet';">
                            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 28 28"
                                 fill="none" style="margin: 18px 5px 0 0">
                                <mask id="mask0_27_398" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0"
                                      y="0"
                                      width="28" height="28">
                                    <rect width="28" height="28" fill="#D9D9D9"/>
                                </mask>
                                <g mask="url(#mask0_27_398)">
                                    <path d="M14 16.975C14.2658 16.975 14.4943 16.8794 14.6855 16.6882C14.8767 16.497 14.9723 16.2685 14.9723 16.0028C14.9723 15.737 14.8767 15.5085 14.6855 15.3173C14.4943 15.1261 14.2658 15.0305 14 15.0305C13.7343 15.0305 13.5058 15.1261 13.3146 15.3173C13.1234 15.5085 13.0278 15.737 13.0278 16.0028C13.0278 16.2685 13.1234 16.497 13.3146 16.6882C13.5058 16.8794 13.7343 16.975 14 16.975ZM14 12.1722C14.2658 12.1722 14.4943 12.0766 14.6855 11.8854C14.8767 11.6942 14.9723 11.4657 14.9723 11.2C14.9723 10.9342 14.8767 10.7058 14.6855 10.5146C14.4943 10.3234 14.2658 10.2278 14 10.2278C13.7343 10.2278 13.5058 10.3234 13.3146 10.5146C13.1234 10.7058 13.0278 10.9342 13.0278 11.2C13.0278 11.4657 13.1234 11.6942 13.3146 11.8854C13.5058 12.0766 13.7343 12.1722 14 12.1722ZM14 7.3694C14.2658 7.3694 14.4943 7.2738 14.6855 7.0826C14.8767 6.8914 14.9723 6.66293 14.9723 6.39718C14.9723 6.13146 14.8767 5.90298 14.6855 5.71177C14.4943 5.52057 14.2658 5.42497 14 5.42497C13.7343 5.42497 13.5058 5.52057 13.3146 5.71177C13.1234 5.90298 13.0278 6.13146 13.0278 6.39718C13.0278 6.66293 13.1234 6.8914 13.3146 7.0826C13.5058 7.2738 13.7343 7.3694 14 7.3694ZM23.7223 20.5333H4.2778C3.74308 20.5333 3.28533 20.3429 2.90454 19.9621C2.52376 19.5814 2.33337 19.1236 2.33337 18.5889V14.0583C3.0269 13.9546 3.60861 13.6354 4.0785 13.1007C4.54842 12.566 4.78337 11.9324 4.78337 11.2C4.78337 10.4676 4.54842 9.83075 4.0785 9.28956C3.60861 8.74834 3.0269 8.43236 2.33337 8.34161V3.81106C2.33337 3.27634 2.52376 2.81859 2.90454 2.43781C3.28533 2.05703 3.74308 1.86664 4.2778 1.86664H23.7223C24.257 1.86664 24.7148 2.05703 25.0955 2.43781C25.4763 2.81859 25.6667 3.27634 25.6667 3.81106V8.34161C24.9732 8.43236 24.3915 8.74834 23.9216 9.28956C23.4517 9.83075 23.2167 10.4676 23.2167 11.2C23.2167 11.9324 23.4517 12.566 23.9216 13.1007C24.3915 13.6354 24.9732 13.9546 25.6667 14.0583V18.5889C25.6667 19.1236 25.4763 19.5814 25.0955 19.9621C24.7148 20.3429 24.257 20.5333 23.7223 20.5333ZM23.7223 18.5889V15.4778C22.9899 14.9981 22.3984 14.3872 21.948 13.6451C21.4975 12.903 21.2723 12.0879 21.2723 11.2C21.2723 10.312 21.4975 9.49696 21.948 8.75484C22.3984 8.01271 22.9899 7.40182 23.7223 6.92218V3.81106H4.2778V6.92218C5.02318 7.40182 5.61786 8.01271 6.06184 8.75484C6.50581 9.49696 6.7278 10.312 6.7278 11.2C6.7278 12.0879 6.50581 12.903 6.06184 13.6451C5.61786 14.3872 5.02318 14.9981 4.2778 15.4778V18.5889H23.7223Z"
                                          fill="white"/>
                                </g>
                            </svg>
                            <span class="card-button-text">Títulos de Transporte</span></div>
                    </div>
                </c:forEach>
                </c:if>
                <button class="return-button" onclick=window.location.href='/home';>Regressar</button>
            </div>


        <div class="footerlogo">
            <footer>
                <img class="footerimage" src="images/logo_nobg.png" alt="">
            </footer>
        </div>

    </div>

    <c:forEach var="leg" items="${legs}" varStatus="status">
        <input type="hidden" id="polylineInput_${status.index}" value="${leg.getOverview_polyline()}">

    </c:forEach>


    <script>
        let map;
        let otherPolylines = []; // Declare an array to hold non-walking Polylines

        async function initMap() {
            const { Map, Polyline } = await google.maps.importLibrary("maps");

            map = new Map(document.getElementById("map"), {
                center: { lat: 38.77851493507939, lng: -9.33226675574515 },
                zoom: 12,
                streetViewControl: false, // Disable street view
                mapTypeControl: false, // Disable map/satellite buttons
                zoomControl: false, // Disable zoom in/out buttons
                styles: [
                    {
                        featureType: "poi",
                        elementType: "labels",
                        stylers: [{ visibility: "off" }], // Hide location labels
                    },
                ],
            });

            // Find all hidden input elements with IDs starting with "polylineInput_"
            const legInputs = document.querySelectorAll('[id^="polylineInput_"]');

            // Define a green color for the first leg
            const greenColor = '#A4DE41';

            // Iterate through the hidden input elements for legs
            legInputs.forEach((input, index) => {
                const polylineString = input.value;

                if (polylineString) {
                    const decodedPath = google.maps.geometry.encoding.decodePath(polylineString);

                    // Create an array to hold LatLng objects
                    const path = [];
                    for (const point of decodedPath) {
                        path.push(new google.maps.LatLng(point.lat(), point.lng()));
                    }

                    // Create a Polyline with the specified color for each leg
                    const legPolyline = new google.maps.Polyline({
                        path: path,
                        map: map,
                        strokeColor: index === 0 ? greenColor : '#CCCCCC', // Green for the first leg, gray for others
                        strokeOpacity: 1,
                        strokeWeight: 4,
                    });

                    otherPolylines.push(legPolyline); // Add the leg polyline to the otherPolylines array

                    // Create a duplicate polyline behind the main one for the outline effect
                    const outlinePolyline = new google.maps.Polyline({
                        path: path,
                        map: map,
                        strokeColor: "#000000", // Outline color
                        strokeOpacity: 0.3, // Full opacity for outline
                        strokeWeight: 7, // Adjust the thickness of the outline
                    });

                    outlinePolyline.setMap(map); // Add the outline polyline to the map

                    if (index === 0) {
                        legPolyline.setOptions({ zIndex: google.maps.Marker.MAX_ZINDEX + 1 });
                    }
                }
            });

            // Create markers for the start and end of the first polyline
            const firstPolyline = otherPolylines[0];

            const svgMarkerStart = {
                path: "M12 2a8 8 0 0 0-7.992 8A12.816 12.816 0 0 0 12 22a12.816 12.816 0 0 0 7.988-12A8 8 0 0 0 12 2zm0 11a3 3 0 1 1 3-3 3 3 0 0 1-3 3z",
                opacity: 1,
                strokeColor: '#041F48',
                fillColor: '#041F48',
                fillOpacity: 1,
                anchor: new google.maps.Point(12, 22),
                scale: 1.2


            };

            const startMarker = new google.maps.Marker({
                position: firstPolyline.getPath().getAt(0), // Start of the first polyline
                map: map,
                icon: svgMarkerStart
            });

            const svgMakerEnd = {
                path: "M2 15h9v3h8V5h-8V2H2V0H0v23h2zM8 4v3h3v3h3V7h3v3h-3v3h3v3h-3v-3h-3v-3H8v3H5v-3H2V7h3V4z M4 7h3v3H5z",
                opacity: 1,
                strokeColor: '#041F48',
                fillColor: '#041F48',
                fillOpacity: 1,
                anchor: new google.maps.Point(2, 24),
                scale: 1.4,
                strokeWeight: 0.1,
            };


                const endMarker = new google.maps.Marker({
                position: firstPolyline.getPath().getAt(firstPolyline.getPath().getLength() - 1), // End of the first polyline
                map: map,
                icon: svgMakerEnd
            });

            // Automatically fit the map to the bounds of all the leg polylines
            const bounds = new google.maps.LatLngBounds();
            otherPolylines.forEach((polyline) => {
                polyline.getPath().forEach((point) => bounds.extend(point));
            });
            map.fitBounds(bounds);
        }

        initMap();
    </script>



    <script async
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&libraries=drawing,geometry,core&callback=initMap">
    </script>

</div>
<%--<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>--%>
</div>
</body>
</html>