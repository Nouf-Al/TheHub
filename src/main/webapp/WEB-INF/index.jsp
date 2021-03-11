<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
   <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
   <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/style/style.css" />
   <link rel="stylesheet" href="/style/index/content.css" />
   <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
   <title>The Hub</title>
</head>
<body>
   <div class="header">
      <div class="background">
         <div class="row p-0 m-0">
            <div class="col-sm p-0 left-section">
               <div class="yellow" data-aos="fade-left"></div>
            </div>
            <div class="col-sm p-0 right-section">
               <div class="green" data-aos="fade-left"></div>
               <div class="pink" data-aos="fade-right"></div>
            </div>
         </div>
      </div>

      <div class="content-container">
         <nav>
            <div class="row p-0 m-0">
               <div class="col p-0 left-nav">
                  <div id="logo">
                     <h1>The Hub</h1>
                  </div>
                  <a class="slide-up-nav" href="#">Projects</a>
                  <a class="slide-up-nav" href="#">Freelancers</a>
               </div>
               <div class="col p-0 right-nav">
                  <span>
                     <a href="/client/login">Client</a>
                     <a href="/freelancer/login">Freelancer</a>
                  </span>
               </div>
            </div>
         </nav>
         <div class="content">
            <div class="row p-0 m-0">
               <div class="col-sm-6 left-content">
                  <h1 class="slide-up-h1"><span>Find the perfect freelance services for your business</span>
                  </h1>
                  <p>A whole world of freelance talent at your fingertips, Find the talent needed to get your
                     business
                     growing.</p>
                  <a href="/client/login"><span>Get Started</span></a>
               </div>
            </div>
         </div>
      </div>
   </div>

   <section class="section-1">
      <div class="row p-0 m-0">
         <div class="col-sm-6 title">
            <h1>Explore the marketplace</h1>
            <p>Find the right freelancer to begin working on your project within minutes.</p>
         </div>
         <div class="col-sm-3 item gray" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-laptop" viewBox="0 0 16 16">
               <path
                  d="M13.5 3a.5.5 0 0 1 .5.5V11H2V3.5a.5.5 0 0 1 .5-.5h11zm-11-1A1.5 1.5 0 0 0 1 3.5V12h14V3.5A1.5 1.5 0 0 0 13.5 2h-11zM0 12.5h16a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5z" />
            </svg>
            <h2>Software Development</h2>
            <p>Get all the technical bells and whistles without paying for a programming degree.</p>
            <div class="img"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
         <div class="col-sm-3 item" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-pencil-square" viewBox="0 0 16 16">
               <path
                  d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
               <path fill-rule="evenodd"
                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
            </svg>
            <h2>Writing & Translation</h2>
            <p>Have a way with words. Get copy, translation & editorial work from freelancers.</p>
            <div class="img gray"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
      </div>
      <div class="row p-0 m-0">
         <div class="col-sm-3 item" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-circle-square" viewBox="0 0 16 16">
               <path d="M0 6a6 6 0 1 1 12 0A6 6 0 0 1 0 6z" />
               <path
                  d="M12.93 5h1.57a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-1.57a6.953 6.953 0 0 1-1-.22v1.79A1.5 1.5 0 0 0 5.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 4h-1.79c.097.324.17.658.22 1z" />
            </svg>
            <h2>Graphics & Design</h2>
            <p>A single place, millions of creative talents.</p>
            <div class="img gray gray-pointer"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
         <div class="col-sm-3 item gray" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-camera" viewBox="0 0 16 16">
               <path
                  d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z" />
               <path
                  d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
            </svg>
            <h2>Video & Animation</h2>
            <p>Your story's unique. Tell it differently with custom video & animation services.</p>
            <div class="img"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
         <div class="col-sm-3 item" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-mic" viewBox="0 0 16 16">
               <path fill-rule="evenodd"
                  d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z" />
               <path fill-rule="evenodd"
                  d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z" />
            </svg>
            <h2>Music & Audio</h2>
            <p>You've got a message. Let the world hear it with music, audio & voice services.</p>
            <div class="img gray"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
         <div class="col-sm-3 item gray" data-aos="slide-up">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
               class="bi bi-bar-chart" viewBox="0 0 16 16">
               <path
                  d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z" />
            </svg>
            <h2>Sales & Marketing</h2>
            <p>Your business = your passion. Outsource smaller tasks so you can focus on growth.</p>
            <div class="img"><img src="/images/icons/pointer.png" alt="pointer"></div>
         </div>
      </div>
   </section>

   <section class="section-2">
      <div class="white"></div>
      <div class="container">
         <h2>THE HUB BY THE NUMBERS</h2>
         <div class="blocks">
            <div class="block shadow" data-aos="slide-up">
               <p>Freelancers working in the hub</p>
               <h4>30,000</h4>
            </div>
            <div class="block shadow" data-aos="slide-up">
               <p>Clients dealing with the hub</p>
               <h4>2,000</h4>
            </div>
         </div>
         <div class="blocks">
            <div class="block shadow" data-aos="slide-up">
               <p>Projects created in the hub</p>
               <h4>35,000</h4>
            </div>
            <div class="block shadow" data-aos="slide-up">
               <p>Reviews written in the hub</p>
               <h4>300</h4>
            </div>
         </div>
      </div>
   </section>

   <div class="section-3">
      <div class="yelloww" data-aos="fade-up"></div>
      <h2><span>Find the perfect match</span></h2>
      <div class="grid-container">
         <div class="main">
            <div class="items">
               <div class="item shadow p-4">
                  <div class="row m-0 p-0">
                     <div class="col-4 p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                           class="bi bi-person-circle" viewBox="0 0 16 16">
                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                           <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                     </div>
                     <div class="col p-0 user-info">
                        <h5>Nouf Alotaibi</h5>
                        <p class="city">Riyadh, SA</p>
                        <p class="major">Programmer</p>
                     </div>
                  </div>
                  <div class="stars px-4">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                  </div>
                  <h4 class="bio p-4">Hello I'm Nouf I work as a freelancer for web sev projects, I'm a good
                     and fast
                     freelacer.</h4>
                  <a href="#" class="view">View Profile</a>
               </div>
               <div class="item shadow p-4">
                  <div class="row m-0 p-0">
                     <div class="col-4 p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                           class="bi bi-person-circle" viewBox="0 0 16 16">
                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                           <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                     </div>
                     <div class="col p-0 user-info">
                        <h5>Nouf Alotaibi</h5>
                        <p class="city">Riyadh, SA</p>
                        <p class="major">Programmer</p>
                     </div>
                  </div>
                  <div class="stars px-4">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                  </div>
                  <h4 class="bio p-4">Hello I'm Nouf I work as a freelancer for web sev projects, I'm a good
                     and fast
                     freelacer.</h4>
                  <a href="#" class="view">View Profile</a>
               </div>
               <div class="item shadow p-4">
                  <div class="row m-0 p-0">
                     <div class="col-4 p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                           class="bi bi-person-circle" viewBox="0 0 16 16">
                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                           <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                     </div>
                     <div class="col p-0 user-info">
                        <h5>Nouf Alotaibi</h5>
                        <p class="city">Riyadh, SA</p>
                        <p class="major">Programmer</p>
                     </div>
                  </div>
                  <div class="stars px-4">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                  </div>
                  <h4 class="bio p-4">Hello I'm Nouf I work as a freelancer for web sev projects, I'm a good
                     and fast
                     freelacer.</h4>
                  <a href="#" class="view">View Profile</a>
               </div>
               <div class="item shadow p-4">
                  <div class="row m-0 p-0">
                     <div class="col-4 p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                           class="bi bi-person-circle" viewBox="0 0 16 16">
                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                           <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                     </div>
                     <div class="col p-0 user-info">
                        <h5>Nouf Alotaibi</h5>
                        <p class="city">Riyadh, SA</p>
                        <p class="major">Programmer</p>
                     </div>
                  </div>
                  <div class="stars px-4">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                  </div>
                  <h4 class="bio p-4">Hello I'm Nouf I work as a freelancer for web sev projects, I'm a good
                     and fast
                     freelacer.</h4>
                  <a href="#" class="view">View Profile</a>
               </div>
               <div class="item shadow p-4">
                  <div class="row m-0 p-0">
                     <div class="col-4 p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                           class="bi bi-person-circle" viewBox="0 0 16 16">
                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                           <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                     </div>
                     <div class="col p-0 user-info">
                        <h5>Nouf Alotaibi</h5>
                        <p class="city">Riyadh, SA</p>
                        <p class="major">Programmer</p>
                     </div>
                  </div>
                  <div class="stars px-4">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path
                           d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                     </svg>
                  </div>
                  <h4 class="bio p-4">Hello I'm Nouf I work as a freelancer for web sev projects, I'm a good
                     and fast
                     freelacer.</h4>
                  <a href="#" class="view">View Profile</a>
               </div>
            </div>
         </div>
      </div>
   </div>

   <footer>
      <p></p>
   </footer>
   
   <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
   <script>
      AOS.init();
   </script>
</body>
<script>
   const slider = document.querySelector('.items');
   let isDown = false;
   let startX;
   let scrollLeft;

   slider.addEventListener('mousedown', (e) => {
      isDown = true;
      slider.classList.add('active');
      startX = e.pageX - slider.offsetLeft;
      scrollLeft = slider.scrollLeft;
   });
   slider.addEventListener('mouseleave', () => {
      isDown = false;
      slider.classList.remove('active');
   });
   slider.addEventListener('mouseup', () => {
      isDown = false;
      slider.classList.remove('active');
   });
   slider.addEventListener('mousemove', (e) => {
      if (!isDown) return;
      e.preventDefault();
      const x = e.pageX - slider.offsetLeft;
      const walk = (x - startX) * 3; //scroll-fast
      slider.scrollLeft = scrollLeft - walk;
   });
</script>
</html>