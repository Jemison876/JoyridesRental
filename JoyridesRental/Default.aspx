<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JoyridesRental._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id ="slides" class ="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#slides" data-slide-to="0" class="active"></li>
                <li data-target="#slides" data-slide-to="1"></li>
                <li data-target="#slides" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="max-width: 100%; height: auto" src="img/landing/pexels-errin-casano-2356071.jpg" />
                    <div class="carousel-caption">
                        <h1 class="display-2">Joyride Rentals</h1>
                        <h3>Make your trips enjoyable</h3>
                        <asp:Button class="btn btn-outline-light btn-lg" id="btndemo" runat="server" Text="VIEW DEMO"/>                        
                        <%--
                            <button type="button" class="btn btn-outline-light btn-lg">
                            VIEW DEMO
                        </button>
                            --%>
                        <button type="button" class="btn btn-primary btn-lg">
                            Get Started
                        </button>
                    </div>
                </div>                 
            </div>
        </div>

        <div class="container-fluid">
            <div class="row jumbotron">
                <div class ="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
                    <p>"Was a pleasure dealing with JoyRide Rental. Extremely professional honest 
                        and delivered (sight unseen) exactly the car discussed in the condition promised"
                    </p>
                    <p>-JoyRide Customer</p>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-2">
                    <a href="About.aspx"><button type="button" class="btn btn-outline-secondary btn-lg">About Us.</button></a>
                </div>
            </div>
        </div>
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1 class="display-4">We are a wholly-owned Jamaican company.</h1>
                </div>
                <hr />
                <div class="col-12">
                    <p class="lead">We serve visitors and locals, leisure and business clients every day of the year.</p>
                </div>
            </div>
        </div>

        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="col-xs-12 col-sm-6 col-md-4">                    
                    <h3>Attractive Rates</h3>
                    <p>We offer extra special deals to groups; and our corporate rates are among the lowest on the island</p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">                    
                    <h3>GPS Navigators</h3>
                    <p>Our GPS Navigators will help you to find your way around the island with precision and ease</p>
                </div>
                <div class="col-xs-12 col-md-4">                    
                    <h3>Car Sales</h3>
                    <p>The programme features a selection of late-model cars, great prices and a no-haggle, 
                        no-hassle car buying process</p>
                </div>
            </div>
            <hr class="my-4" />
            <figure>
                <div class ="fixed-wrap">
                    <div id="fixed"></div>
                </div>
            </figure>            
        </div>

        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="col-12">
                    <h2>Our Joy Rides</h2>
                </div>
                <div class="container-fluid padding">
                    <div class="row padding">
                        <div class="col-md-4">
                            <div class="card">
                                <img style="max-width: 100%; height: auto" class="card-imd-top" src="img/2021-jaguar-f-type.jpg" alt="Alternate Text" />
                                <div class="card-body">                        
                                    <h4 class="card-title">JAGUAR</h4>
                                    <p>$19000/day</p>
                                    <a class="btn btn-outline-secondary" href="ProductList.aspx">See car collection</a>
                                </div>
                            </div>
                        </div>            
                        <div class="col-md-4">
                            <div class="card">
                                <img style="max-width: 100%; height: auto" class="card-imd-top" src="img/suzuki-jimny.jpg" alt="Alternate Text" />
                                <div class="card-body">
                                    <h4 class="card-title">SUZUKI</h4>
                                    <p>$4750/day</p>
                                    <a class="btn btn-outline-secondary" href="ProductList.aspx">See car collection</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img style="max-width: 100%; height: auto" class="card-imd-top" src="img/2020-kia-optima-hybrid-07.jpg" alt="Alternate Text" />
                                <div class="card-body">                        
                                    <h4 class="card-title">KIA</h4>
                                    <p>$3550/day</p>
                                    <a class="btn btn-outline-secondary" href="ProductList.aspx">See car collection</a>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
</asp:Content>
