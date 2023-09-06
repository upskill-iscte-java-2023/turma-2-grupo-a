<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vias League</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/vias_league.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:wght@100&display=swap"
          rel="stylesheet">
</head>
<body>
<div class="container mt-5 vias_leaguebox">
    <div class="row justify-content-center">
        <div class="col-md-auto">
            <div class="vias_league-container">

                <div class="card p-3">
                    <img class="imagelogo" src="images/vias_league.v3.png">

                    <div class="d-grid">
                        <div class="btn-group ">
                            <button type="button" class="btn btn-primary-outline">My League</button>
                            <button type="button" class="btn btn-primary-outline">Leaderboard</button>
                        </div>
                    </div>


                </div>

            </div>
            <div class="col-md-auto text-center">
                <div class="footerlogo">
                    <jsp:include page="footer.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>