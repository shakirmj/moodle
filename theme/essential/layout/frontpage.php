<?php if (!isloggedin() || isguestuser()): ?>
<!DOCTYPE html>
<!--[if IEMobile 7 ]> <html dir="ltr" lang="en-US"class="no-js iem7"> <![endif]-->
<!--[if lt IE 7 ]> <html dir="ltr" lang="en-US" class="no-js ie6 oldie"> <![endif]-->
<!--[if IE 7 ]>    <html dir="ltr" lang="en-US" class="no-js ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html dir="ltr" lang="en-US" class="no-js ie8 oldie"> <![endif]-->
<!--[if (gte IE 9)|(gt IEMobile 7)|!(IEMobile)|!(IE)]><!--><html dir="ltr" lang="en-US" class="no-js"><!--<![endif]-->
<head>
    	<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

		<title>Top-Grader</title>
        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>

        <!-- MetaTags -->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- Set your favicon -->
        <link rel="icon" href="favicon.ico" type="image/x-icon" />

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/jquery.sidr.light.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/photostack.css">
        <link rel="stylesheet" href="css/jquery.bxslider.css">
        <link rel="stylesheet" href="css/drawingSVG.css">
        <link rel="stylesheet" href="css/prettyPhoto.css">
        <link rel="stylesheet" href="css/foundation-icons.css">
        <link rel="stylesheet" href="css/app.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- Header Scripts -->
        <script src="js/vendor/modernizr-2.7.1.min.js"></script>
        </head>
		<body>
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->


        <!-- Preloader -->
        <div class="preloader-section">
            <img src="img/preloader.gif" alt="Site Preloader">
        </div>

        <a id="simple-menu" href="#sidr">
            <i class="fi-list"></i>
            Top-Grader
        </a>

        <div id="sidr">
          <button>
          <i class="fi-x"></i>CLose Menu</button>
          <ul>
            <li><a href="#">Home</a></li>
                    <li><a href="#our-company">K-12</a></li>
                    <li><a href="#amazing-team">Test Prep</a></li>
                    <li><a href="#tutors">Our Tutors</a></li>
                    <li><a href="#results">Our Results</a></li>
                    <li><a href="#section-six">Pricing</a></li>
					<li><a href="#section-six">Login</a></li>
          </ul>
        </div>


        <!-- Image Top Container -->
        <section id="top-image" class="homepage-two">
            <div class="overlay-mask"></div>

            <div id="section-four" class="homepage-two">
                <div class="our-services row">

                    <div class="text-container text-one">
                        <h4>Delivers Real <br> <span>Results</span></h4>

                        <p>Start getting results with online tutoring today!<br> 1-on-1 interactive online tutoring for K - 12 <br> Homework Help in Math & Science<br> Test Prep - SCAT/SAT/ACT/GRE/GMAT/Other </p>
                    </div>

                    <div class="large-12 columns holder-logo">


                    </div>

                    <div class="large-12 columns">
                        <figure>
                            <div class="drawings mac">
                                <img class="illustration" src="img/services.png" alt="Mockup Illustration" />
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="97.5%" height="100%" viewBox="0 0 1199 593" enable-background="new 0 0 1199 593" xml:space="preserve" class="line-drawing drawing-two">

                                </svg>
                            </div>
                        </figure>
                    </div>
                    <div class="text-container text-two large-5">
                        <h4><span>Get Better Tutoring<br></span> Get Better Results</h4>

                        <p>Not Sure? Take a 30 minutes free trial session <br> <a href="#" class="try-now-button">Try Now</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <img src="img/contact2.png" alt="Featured Icon" width="25" height="25">1800 626 9803</p>
					<div class="form-section large-8">
						<form action="<?php echo $CFG->httpswwwroot; ?>/login/index.php" method="post" id="login" <?php echo $autocomplete; ?>>
                    <div class="row">
                        <div class="large-12 columns">
                            <div class="input-wrap">
                                <label for="name">
                                    <img src="img/label1.png" height="20" width="16" alt="Featured Icon">
                                </label>
                                <input type="text" name="username" id="username" placeholder="USER NAME:">
                            </div>
                        </div>
                        <div class="large-12 columns">
                            <div class="input-wrap">
                                <label for="email">
                                    <img src="img/key.png" alt="Featured Icon" width="20" height="20">
                                </label>
                                <input type="password" name="password" id="password" placeholder="PASSWORD:">
                            </div>
                        </div>
                        <div class="large-6  columns submit-wrap">
                        <input type="submit" id="loginbtn" value="<?php print_string("login") ?>" />

                        </div>
                        <div class="large-6  columns submit-wrap">
                            <input type="submit" value="Sign Up">
                        </div>
                        <?php require_once($CFG->dirroot . '/auth/googleoauth2/lib.php'); auth_googleoauth2_display_buttons(); ?>
                    </div>
                </form>
				</div>
                        <div class="large-4 columns">



                		</div>
                    </div>

                </div>
            </div>

                        <!-- Header Menu -->
            <header id="top-header">
                <div class="row">
                    <div class="large-12 columns">
                        <div class="logo-holder">
                            <img src="img/logo.png">
                        </div>

                        <div class="skew-wrapper"></div>
                        <ul id="nav-menu">
                            <li><a href="#">Home</a></li>
							<li><a href="#results">Our Results</a></li>
                            <li><a href="#our-company">K-12</a></li>
                            <li><a href="#amazing-team">Test Prep</a></li>
                            <li><a href="#tutors">Our Tutors</a></li>
                            <li><a href="#section-six">Pricing</a></li>
                        </ul>
                    </div>
                </div>
            </header>


            <!-- Social Icons -->
            <ul id="socials">
                <li><a target="_blank" title="Follow me on Facebook" href="https://www.facebook.com/"><i class="fi-social-facebook"></i></a></li>
                <li><a target="_blank" title="Follow me on Twitter" href="https://twitter.com/"><i class="fi-social-twitter"></i></a></li>
            </ul>

        </section>

		<section id="results">
			<!-- Parallax -->
			<div class="parallax parallax-counters">
				

				<div class="row">
					<div class="large-12 columns">
						<h4>Our Results</h4>
						
					</div>
				</div>

				<div class="row">
					<div class="large-3 columns medium-6 count-holder">
						<div class="counter counter-one"></div><div>%</div>
						<p>90+ percentile score in SCAT</p>
					</div>
					<div class="large-3 columns medium-6 count-holder">
						<div class="counter counter-two"></div><div>%</div>
						<p>Improved Grades</p>
					</div>
					<div class="large-3 columns medium-6 count-holder">
						<div class="counter counter-three"></div><div>%</div>
						<p>Improved Problem Solving Skills</p>
					</div>
					<div class="large-3 columns medium-6 count-holder">
						<div class="counter counter-four"></div><div>%</div>
						<p>Satisifed Parents</p>
					</div>
				</div>

			</div>
		</section>
	
        <section id="our-company">
            <div class="row waypoint-element">
                <div class="large-12 columns homepage-two-subtitle">
                    <h4>K-12 <span>Tutoring</span></h4>
                    <p>K-12 is a designation for the sum of primary and secondary education. It is used in the United States, Canada, Turkey, the Philippines, and Australia.
                    You can choose from our 4-Hour, 8-Hour, or 12-Hour K-12 tutoring plans for help in homework, assignments, test preparation, or to master a particular topic.</p>
                </div>
            </div>

            <div class="row company-facts waypoint-element">
                <div class="large-4 medium-6 columns">
                    <img src="img/company1.png" height="71" width="126" alt="Featured Image">
                    <h6><span>Math</span></h6>
                    <p>We work with you step by step and help you solve problems. We do not do it for you but do it with you and coach you as you progress, teaching you key concepts and helping you internalize them.</p>
					<p style="padding-top: 10px;"><a href="course/view.php?id=6" class="try-now-button">Try Now</a><a href="#" class="try-now-button">Buy Now</a></p>
                </div>
                <div class="large-4 medium-6 columns">
                    <img src="img/company2.png" alt="Featured Image" width="126" height="71">
                    <h6><span>Science</span></h6>
                    <p>The tutors at Top Grader are professional, master degree holders in Physics, Chemistry, Biology, and other scientific fields. They can help you with your homework, assignments, and learning in every science topic.</p>
					<p style="padding-top: 10px;"><a href="course/view.php?id=7" class="try-now-button">Try Now</a><a href="#" class="try-now-button">Buy Now</a></p>
                </div>
                <div class="large-4 medium-6 columns">
                    <img src="img/company3.png" alt="Featured Image" width="126" height="71">
                    <h6><span>English</span></h6>
                    <p>At Top Grader, our tutors know what it takes to improve your English language skills. All our tutors possess a Master degree in English and are well-versed in teaching English Grammar, Literature, Reading, Writing, etc.</p>
					<p style="padding-top: 10px;"><a href="course/view.php?id=11" class="try-now-button">Try Now</a><a href="#" class="try-now-button">Buy Now</a></p>
                </div>

            </div>
        </section>



		<!-- Team Section -->
        <section id="amazing-team">
            <div class="row waypoint-element">
                <div class="columns large-12 intro-text">
                    <h2>Test Prep</h2>
                    <p>Designed to increase student's performance on standardized tests.</p>
                </div>
            </div>

            <div class="row members-section waypoint-element">
                <div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                        <div class="large-offset-6 columns"></div>
                        <div class="large-6 columns member-info">
                            <h5>SCAT</h5>
                            <p><strong>8 out of 10</strong> students enrolled with us &nbsp &nbsp&nbsphave scored a <strong>90+</strong> percentile on the SCAT. We are the pioneers in online SCAT preparation, our structured approach to testprep has helped students ace the SCAT with 90+ percentile!</p>
                            <ul class="social-links">
								<li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                        <div class="large-offset-6 columns"></div>
                        <div class="large-6 columns member-info">
                            <h5>SAT</h5>
                            <p>&nbsp&nbsp&nbsp&nbspOur SAT tutors have spent several years mastering concepts, tricks, and strategies that can help a student solve Math problems faster and answer critical reading questions accurately, resulting in a higher score.</p>
                            <ul class="social-links">
								<li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row members-section waypoint-element">
                <div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                        <div class="large-6 columns member-info">
                            <h5>&nbspACT</h5>
                            <p>Top Grader is home to senior tutors who are adept at ACT test preparation.  Our ACT tutors hold a Master in Math, English, and Science subjects so you can be assured that you will be prepared well for your test.&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
                            <ul class="social-links">
							    <li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>
                        <div class="large-offset-6 columns"></div>
                    </div>
                </div>
                <div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                        <div class="large-6 columns member-info">
                            <h5>&nbspGRE</h5>
                            <p>The GRE tutors at Top Grader have had Math and English Language as their favourite subject in their undergraduate and Master courses. They are well-versed with the GRE test structure, topics tested, and the strategies that can improve a student's scores on the test.</p>

                            <ul class="social-links">
								<li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>
                        <div class="large-offset-6 columns"></div>
                    </div>
                </div>
			</div>
			<div class="row members-section">
                <div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                    	<div class="large-offset-6 columns"></div>
                        <div class="large-6 columns member-info">
                            <h5>GMAT</h5>
                            <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Like GRE, our GMAT tutors are &nbsp&nbsp&nbsp&nbsp&nbsp&nbspexperts in Math and Critical &nbsp&nbsp&nbsp&nbspReasoning. Some of the GMAT tutors are senior professionals with several years of experience teaching Math Reasoning at top test preparation coaching institutes for business schools. </p>

                            <ul class="social-links">
								<li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>
                	</div>
                </div>
				<div class="large-6 columns member" style="background-image: url(img/team-2-1.jpg)">
                    <div class="skew-container"></div>
                    <div class="row">
                    	<div class="large-offset-6 columns"></div>
                        <div class="large-6 columns member-info">
                            <h5>Others</h5>
                            <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTop Grader also helps students &nbsp&nbsp&nbsp&nbsp&nbsp&nbspprepare for other well know &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspstandardized tests such as the NJ ASK, FCAT, ISAT, STAR, TAKS, &nbsp&nbsp&nbsp&nbsp&nbspTERRANOVA, HSPT, etc. You can &nbsp&nbsp&nbsp&nbspchoose from our monthly 4-Hour, 8-Hour, and 12-Hour plans. </p>

                            <ul class="social-links">
								<li><a href="#" target="_blank" title="Read More">
                                    Read More
                                </a></li>
                                <li><a href="#" target="_blank" title="Try for Free">
                                    Try
                                </a></li>
                                <li><a href="#" target="_blank" title="Buy Now">
                                    Buy
                                </a></li>
                            </ul>
                        </div>

                	</div>
                </div>
			</div>
        </section>

        <section id="tutors">
            <div class="row">
                <div class="large-6 columns">
                    <h4>Our <span>Tutors</span> <br></h4>
                    <p><strong>Handpicked  <span>Qualified Tutors</span></strong><br>All our tutors hold at least a Master Degree except for elementary school Math and Science tutors for which we have Graduates in Math or Engineering subjects. All our tutors go through a exhaustive qualification process that includes testing on subject knowledge, tutoring experience, training session and certification process. We also do a detailed background and reference check on our tutors.</p>
                    <p><strong>Know the <span>state and school district curriculum</span></strong><br> Our tutors have experience teaching students in different states and school districts. The worksheets and study material used by our tutors is aligned to the student's curriculum that is followed in his/her school. In addition, our tutors have a full resource library they can access any time.</p>
                    <a href="#">Read More</a>
                    <br>
                </div>
                <div class="large-6 columns">
                    <div class="img-mockups waypoint-mockups">
                        <img src="img/mockup3.png" height="470" width="297" alt="Featured Mockup">
                        <img src="img/mockup-small.png" height="404" width="296" alt="Featured Mockup">
                    </div>
                </div>
            </div>
        </section>

		<section id="section-six">
            <div class="row waypoint-element">
                <div class="columns large-12 intro-text">
                    <h2>Choose your tutoring plan!</h2>
                    <p><strong>Money Back Guarantee</strong> If you are not satisfied with our tutoring service you can choose to opt out before the start of your third tutoring session. We will refund the entire amount, no questions asked!</p>
                    <h3>K-12</h3>
                </div>
            </div>

            <div class="member-area row waypoint-element">
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>1 hour</h5>
                            <p>$14.99 <span>/per class</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>1 hour</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>4 hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$59 99/month</span></p></strong>
                            <p>$49 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>4 hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>8 Hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$119 99/month</span></p></strong>
                            <p>$99 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>8 Hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>12 Hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$179 99/month</span></p></strong>
                            <p>$139 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>12 Hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row waypoint-element">
                <div class="columns large-12 intro-text" style="padding-top:1px;">
                    <h3>Test Prep</h3>
                </div>
            </div>
            <div class="member-area row waypoint-element">
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>1 Hour Per class</h5>
                            <p>$18.99 <span>/per class</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>1 Hour Per class</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>4 hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$75 99/month</span></p></strong>
                            <p>$65 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>4 hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>8 Hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$151 99/month</span></p></strong>
                            <p>$131 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>8 Hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
                <div class="large-3 small-6 flip-container columns">
                    <div class="flipper">
                        <div class="front">
                            <div class="border"></div>

                            <h5>12 Hours Per month</h5>
                            <strong style="text-decoration:line-through;"><p><span>$227 99/month</span></p></strong>
                            <p>$187 <span>99/month</span></p>
                            <a href="#">Select Plan</a>
                        </div>
                        <div class="back">
                            <div class="border"></div>
                            <h5>12 Hours Per month</h5>
                            <a href="#">Select Plan</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        	<div id="contact-section" class="parallax parallax-contact parallax-testimonials">
            <div class="parallax-overlay"></div>
            <div class="large-12 columns">
                    <h4>Testimonials</h4>
                </div>
			<div class="row waypoint-element">

                <div class="large-9 columns large-centered small-centered">
                    <ul class="testimonials-slider">
                        <li>
                            <div class="border-1"></div>
                            <div class="border-2"></div>
                            <h5>Jacqueline, MI</h5>
                            <span>97th percentile on SCAT!</span>
                            <p>My daughter scored a 97th percentile on the SCAT Math. She has qualified for the Math summer camp at CTY! Thanks Top Grader team for all the help. Your tutors are great, and your structured SCAT curriculum is the best my daughter could get!</p>
                        </li>
                        <li>
                            <div class="border-1"></div>
                            <div class="border-2"></div>
                            <h5>Lisa and Nick (David's parents), Canada</h5>
                            <span>Math Tutoring/Homework Help</span>
                            <p>I wanted you to know that for the first time in years, David got a "A" on a math test this week - his first quiz of the school year! I wanted to thank you guys for your help in getting him to this level.</p>
                        </li>

                    </ul>
                </div>
            </div>
            <br/>
            <br/>
            <div class="row">
                <div class="large-12 columns">
                    <h4>Contact Us Today</h4>
                    <p>After a humble start in Singapore, Top Grader has made its name as a pioneer in quality online tutoring in UK, Australia, USA, and Canada. Top Grader came into existence to make quality, one-on-one online tutoring accessible to students at affordable prices. The senior management of top-grader comprises of people who have had more than a decade of international experience in the education, training and development industry. Our directors and partners are graduates from some of the top business schools of the world where they have worked as mentors, teachers, and academic counselors themselves.</p>
                </div>
            </div>
            <div class="row">
                <div class="large-4 columns">
                    <div class="icon-holder">
                        <img src="img/contact1.png" height="36" width="52" alt="Featured Icon">
                    </div>
                    <p>
                        <a href="mailto:info@top-grader.com?subject=Mail from Our Site">info@top-grader.com</a>
                    </p>
                </div>
                <div class="large-4 columns">
                    <div class="icon-holder">
                        <img src="img/contact2.png" alt="Featured Icon" width="50" height="50">
                    </div>
                    <p>1800 626 9803</p>
                </div>
                <div class="large-4 columns">
                    <div class="icon-holder">
                        <img src="img/contact3.png" alt="Featured Icon" width="50" height="50">
                    </div>
                    <p>Lucknow, India</p>
                </div>
            </div>
			<!-- Form Section -->
        <div class="row form-section">
            <div class="large-10 columns large-centered small-centered">
                <form action="#">
                    <div class="row">
                        <div class="large-6 columns">
                            <div class="input-wrap">
                                <label for="name">
                                    <img src="img/label1.png" height="20" width="16" alt="Featured Icon">
                                </label>
                                <input type="text" name="name" id="name" placeholder="NAME:">
                            </div>
                        </div>
                        <div class="large-6 columns">
                            <div class="input-wrap">
                                <label for="email">
                                    <img src="img/label2.png" alt="Featured Icon" width="20" height="14">
                                </label>
                                <input type="email" name="email" id="email" placeholder="EMAIL:">
                            </div>
                        </div>
                        <div class="large-6 columns">
                            <div class="input-wrap">
                                <label for="subject">
                                    <img src="img/label3.png" alt="Featured Icon" width="20" height="20">
                                </label>
                                <input type="text" name="subject" id="subject" placeholder="SUBJECT:">
                            </div>
                        </div>
                        <div class="large-6 columns">
                            <div class="input-wrap">
                                <label for="message">
                                    <img src="img/label4.png" alt="Featured Icon" width="20" height="16">
                                </label>
                                <input type="text" name="message" id="message" placeholder="MESSAGE:">
                            </div>
                        </div>
                        <div class="large-12 columns submit-wrap">
                            <input type="submit" value="Send Message">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        </div>

        <footer>
        	<a href="#" class="go-top"></a>
        </footer>

        <!-- Essential Scripts -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bower_components/foundation/js/foundation.min.js"></script>
        <script src="js/min/app.min.js" type="text/javascript"></script>
        <script src="js/min/retina-1.1.0.min.js" type="text/javascript"></script>

        <!-- Page Specific Scripts -->
        <script src="js/min/jquery.sidr.min.js" type="text/javascript"></script>
        <script src="js/min/waypoints.min.js" type="text/javascript"></script>
        <script src="js/min/masonry.min.js" type="text/javascript"></script>
        <script src="js/min/smoothScroll.min.js" type="text/javascript"></script>
        <script src="js/min/jquery.parallax-1.1.3.min.js" type="text/javascript"></script>
        <script src="js/min/tweetable.jquery.min.js" type="text/javascript"></script>
        <script src="js/min/classie.min.js" type="text/javascript"></script>
        <script src="js/min/jquery.timeago.min.js" type="text/javascript"></script>
        <script src="js/min/svganimations.min.js" type="text/javascript"></script>
        <script src="js/min/jquery.bxslider.min.js" type="text/javascript"></script>
        <script src="js/min/jquery.prettyPhoto.min.js" type="text/javascript"></script>
        <script src="js/min/imagesLoaded.min.js" type="text/javascript"></script>
        <script src="js/min/counter.min.js" type="text/javascript"></script>
        <script src="js/min/main-second.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            // Init Counters
            jQuery(function($) {


                $(window).load(function() {


                    // Init Bx for Testimonials
                    $('.testimonials-slider').bxSlider({
                        adaptiveHeight : true,
                        pager : false,
                        hideControlOnEnd : true,
                        infiniteLoop : false
                    });
                });

            });
        </script>

    </body>
    <?php
	            echo $OUTPUT->course_content_header();
	            echo $OUTPUT->main_content();
	            echo $OUTPUT->course_content_footer();
	            ?>
    <?php else: ?>




<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * The Essential theme is built upon the Bootstrapbase theme.
 *
 * @package    theme
 * @subpackage Essential
 * @author     Julian (@moodleman) Ridden
 * @author     Based on code originally written by G J Bernard, Mary Evans, Bas Brands, Stuart Lamour and David Scotson.
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
$hashiddendock = (empty($PAGE->layout_options['noblocks']) && $PAGE->blocks->region_has_content('hidden-dock', $OUTPUT));
$sideregionsmaxwidth = (!empty($PAGE->theme->settings->sideregionsmaxwidth));

$hasslide1 = (!empty($PAGE->theme->settings->slide1));
$hasslide1image = (!empty($PAGE->theme->settings->slide1image));
$hasslide1caption = (!empty($PAGE->theme->settings->slide1caption));
$hasslide1url = (!empty($PAGE->theme->settings->slide1url));
$hasslide2 = (!empty($PAGE->theme->settings->slide2));
$hasslide2image = (!empty($PAGE->theme->settings->slide2image));
$hasslide2caption = (!empty($PAGE->theme->settings->slide2caption));
$hasslide2url = (!empty($PAGE->theme->settings->slide2url));
$hasslide3 = (!empty($PAGE->theme->settings->slide3));
$hasslide3image = (!empty($PAGE->theme->settings->slide3image));
$hasslide3caption = (!empty($PAGE->theme->settings->slide3caption));
$hasslide3url = (!empty($PAGE->theme->settings->slide3url));
$hasslide4 = (!empty($PAGE->theme->settings->slide4));
$hasslide4image = (!empty($PAGE->theme->settings->slide4image));
$hasslide4caption = (!empty($PAGE->theme->settings->slide4caption));
$hasslide4url = (!empty($PAGE->theme->settings->slide4url));
$hasslideshow = ($hasslide1||$hasslide2||$hasslide3||$hasslide4);
$hasanalytics = (empty($PAGE->theme->settings->useanalytics)) ? false : $PAGE->theme->settings->useanalytics;

$hasalert1 = (empty($PAGE->theme->settings->enable1alert)) ? false : $PAGE->theme->settings->enable1alert;
$hasalert2 = (empty($PAGE->theme->settings->enable2alert)) ? false : $PAGE->theme->settings->enable2alert;
$hasalert3 = (empty($PAGE->theme->settings->enable3alert)) ? false : $PAGE->theme->settings->enable3alert;
$alertinfo = '<span class="fa-stack "><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-info fa-stack-1x fa-inverse"></i></span>';
$alertwarning = '<span class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-warning fa-stack-1x fa-inverse"></i></span>';
$alertsuccess = '<span class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-bullhorn fa-stack-1x fa-inverse"></i></span>';

$hasmarketing1image = (!empty($PAGE->theme->settings->marketing1image));
$hasmarketing2image = (!empty($PAGE->theme->settings->marketing2image));
$hasmarketing3image = (!empty($PAGE->theme->settings->marketing3image));

$hasfrontpageblocks = (empty($PAGE->theme->settings->frontpageblocks)) ? false : $PAGE->theme->settings->frontpageblocks;

$haslogo = (!empty($PAGE->theme->settings->logo));

$hasanalytics = (empty($PAGE->theme->settings->useanalytics)) ? false : $PAGE->theme->settings->useanalytics;

/* Slide1 settings */
$hideonphone = $PAGE->theme->settings->hideonphone;
if ($hasslide1) {
    $slide1 = $PAGE->theme->settings->slide1;
}
if ($hasslide1image) {
    $slide1image = $PAGE->theme->setting_file_url('slide1image', 'slide1image');
}
if ($hasslide1caption) {
    $slide1caption = $PAGE->theme->settings->slide1caption;
}
if ($hasslide1url) {
    $slide1url = $PAGE->theme->settings->slide1url;
}

/* slide2 settings */
if ($hasslide2) {
    $slide2 = $PAGE->theme->settings->slide2;
}
if ($hasslide2image) {
    $slide2image = $PAGE->theme->setting_file_url('slide2image', 'slide2image');
}
if ($hasslide2caption) {
    $slide2caption = $PAGE->theme->settings->slide2caption;
}
if ($hasslide2url) {
    $slide2url = $PAGE->theme->settings->slide2url;
}

/* slide3 settings */
if ($hasslide3) {
    $slide3 = $PAGE->theme->settings->slide3;
}
if ($hasslide3image) {
    $slide3image = $PAGE->theme->setting_file_url('slide3image', 'slide3image');
}
if ($hasslide3caption) {
    $slide3caption = $PAGE->theme->settings->slide3caption;
}
if ($hasslide3url) {
    $slide3url = $PAGE->theme->settings->slide3url;
}

/* slide4 settings */
if ($hasslide4) {
    $slide4 = $PAGE->theme->settings->slide4;
}
if ($hasslide4image) {
    $slide4image = $PAGE->theme->setting_file_url('slide4image', 'slide4image');
}
if ($hasslide4caption) {
    $slide4caption = $PAGE->theme->settings->slide4caption;
}
if ($hasslide4url) {
    $slide4url = $PAGE->theme->settings->slide4url;
}

theme_essential_check_colours_switch();
theme_essential_initialise_colourswitcher($PAGE);

$bodyclasses = array();
$bodyclasses[] = 'two-column';
$bodyclasses[] = 'essential-colours-' . theme_essential_get_colours();
if ($sideregionsmaxwidth) {
    $bodyclasses[] = 'side-regions-with-max-width';
}

$left = (!right_to_left());  // To know if to add 'pull-right' and 'desktop-first-column' classes in the layout for LTR.
echo $OUTPUT->doctype() ?>
<html <?php echo $OUTPUT->htmlattributes(); ?>>
<head>
    <title><?php echo $OUTPUT->page_title(); ?></title>
    <link rel="shortcut icon" href="<?php echo $OUTPUT->favicon(); ?>" />
    <?php echo $OUTPUT->standard_head_html() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <noscript>
			<link rel="stylesheet" type="text/css" href="<?php echo $CFG->wwwroot;?>/theme/essential/style/nojs.css" />
	</noscript>
    <!-- Google web fonts -->
    <?php require_once(dirname(__FILE__).'/includes/fonts.php'); ?>
    <!-- iOS Homescreen Icons -->
    <?php require_once(dirname(__FILE__).'/includes/iosicons.php'); ?>

    </head>
	<body <?php echo $OUTPUT->body_attributes($bodyclasses); ?>>

		<!-- preloader-->
		<div class="whitebg">
			<div id="spinner"></div>
		</div>


	<?php echo $OUTPUT->standard_top_of_body_html() ?>

	<?php require_once(dirname(__FILE__).'/includes/header.php'); ?>

	<header role="banner" class="navbar" id="header">

	    <nav role="navigation" class="navbar-inner" id="mainnav">
	        <div class="container-fluid">

				<?php if (isloggedin()): ?>
		            <a class="brand" href="<?php echo $CFG->wwwroot;?>"><?php echo $SITE->shortname; ?></a>
		            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		            </a>
	            <?php endif ?>

	            <div class="nav-collapse collapse">
	                <?php echo $OUTPUT->custom_menu(); ?>

	                <ul class="nav pull-right">
	                    <li class="external"><?php echo $OUTPUT->page_heading_menu(); ?></li>
	                    <li class="navbar-text external"><?php echo $OUTPUT->login_info() ?></li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	    <div class="clear"></div>

	</header>

		<!-- Start Main Regions -->
		<div id="page" class="container-fluid">

		<!-- Start Alerts -->

		<!-- Alert #1 -->
		<?php if ($hasalert1) { ?>
			<div class="useralerts alert alert-<?php echo $PAGE->theme->settings->alert1type ?>">
			<a class="close" data-dismiss="alert" href="#">Ã—</a>
			<?php
			if ($PAGE->theme->settings->alert1type == 'info') {
				$alert1icon = $alertinfo;
		    } else if ($PAGE->theme->settings->alert1type == 'error') {
		    	$alert1icon = $alertwarning;
		   	} else {
		   		$alert1icon = $alertsuccess;
		   	}
		    $alert1title = 'alert1title_'.current_language();
		    $alert1text = 'alert1text_'.current_language();
		   	echo $alert1icon.'<span class="title">'.$PAGE->theme->settings->$alert1title.'</span>'.$PAGE->theme->settings->$alert1text; ?>
		</div>
		<?php } ?>

		<!-- Alert #2 -->
		<?php if ($hasalert2) { ?>
			<div class="useralerts alert alert-<?php echo $PAGE->theme->settings->alert2type ?>">
			<a class="close" data-dismiss="alert" href="#">Ã—</a>
			<?php
			if ($PAGE->theme->settings->alert2type == 'info') {
				$alert2icon = $alertinfo;
		    } else if ($PAGE->theme->settings->alert2type == 'error') {
		    	$alert2icon = $alertwarning;
		   	} else {
		   		$alert2icon = $alertsuccess;
		   	}
		    $alert2title = 'alert2title_'.current_language();
		    $alert2text = 'alert2text_'.current_language();
		   	echo $alert2icon.'<span class="title">'.$PAGE->theme->settings->$alert2title.'</span>'.$PAGE->theme->settings->$alert2text; ?>
		</div>
		<?php } ?>

		<!-- Alert #3 -->
		<?php if ($hasalert3) { ?>
			<div class="useralerts alert alert-<?php echo $PAGE->theme->settings->alert3type ?>">
			<a class="close" data-dismiss="alert" href="#">Ã—</a>
			<?php
			if ($PAGE->theme->settings->alert3type == 'info') {
				$alert3icon = $alertinfo;
		    } else if ($PAGE->theme->settings->alert3type == 'error') {
		    	$alert3icon = $alertwarning;
		   	} else {
		   		$alert3icon = $alertsuccess;
		   	}
		    $alert3title = 'alert3title_'.current_language();
		    $alert3text = 'alert3text_'.current_language();
		   	echo $alert3icon.'<span class="title">'.$PAGE->theme->settings->$alert3title.'</span>'.$PAGE->theme->settings->$alert3text; ?>
		</div>
		<?php } ?>
		<!-- End Alerts -->

		<!-- Start Slideshow -->
		<?php
			if($PAGE->theme->settings->toggleslideshow==1) {
				require_once(dirname(__FILE__).'/includes/slideshow_'. ($PAGE->theme->settings->slideshowvariant) .'.php');
			} else if($PAGE->theme->settings->toggleslideshow==2 && !isloggedin()) {
				require_once(dirname(__FILE__).'/includes/slideshow_'. ($PAGE->theme->settings->slideshowvariant) .'.php');
			} else if($PAGE->theme->settings->toggleslideshow==3 && isloggedin()) {
				require_once(dirname(__FILE__).'/includes/slideshow_'. ($PAGE->theme->settings->slideshowvariant) .'.php');
			}
		?>
		<!-- End Slideshow -->

		<!-- Start Marketing Spots -->
		<?php
			if($PAGE->theme->settings->togglemarketing==1) {
				require_once(dirname(__FILE__).'/includes/marketingspots.php');
			} else if($PAGE->theme->settings->togglemarketing==2 && !isloggedin()) {
				require_once(dirname(__FILE__).'/includes/marketingspots.php');
			} else if($PAGE->theme->settings->togglemarketing==3 && isloggedin()) {
				require_once(dirname(__FILE__).'/includes/marketingspots.php');
			}
		?>
		<!-- End Marketing Spots -->

		<!-- Start Middle Blocks -->
		<?php
			if($PAGE->theme->settings->frontpagemiddleblocks==1) {
				require_once(dirname(__FILE__).'/includes/middleblocks.php');
			} else if($PAGE->theme->settings->frontpagemiddleblocks==2 && !isloggedin()) {
				require_once(dirname(__FILE__).'/includes/middleblocks.php');
			} else if($PAGE->theme->settings->frontpagemiddleblocks==3 && isloggedin()) {
				require_once(dirname(__FILE__).'/includes/middleblocks.php');
			}
		?>
		<!-- End Middle Blocks -->

		<!-- Start Frontpage Content -->
		<?php if($PAGE->theme->settings->usefrontcontent ==1) {
			echo $PAGE->theme->settings->frontcontentarea;
			?>
			<div class="bor" style="margin-top: 10px;"></div>
		<?php }?>
		<!-- End Frontpage Content -->

	    <div id="page-content" class="row-fluid">
	    	<?php if ($hasfrontpageblocks==1) { ?>
	        <section id="region-main" class="span8 pull-right">
	        <?php } else { ?>
	        <section id="region-main" class="span8 desktop-first-column">
	        <?php } ?>
	        	<div id="page-navbar" class="clearfix">
	            	<div class="breadcrumb-nav"><?php echo $OUTPUT->navbar(); ?></div>
	            	<nav class="breadcrumb-button"><?php echo $OUTPUT->page_heading_button(); ?></nav>
	        	</div>
	            <?php
	            echo $OUTPUT->course_content_header();
	            echo $OUTPUT->main_content();
	            echo $OUTPUT->course_content_footer();
	            ?>
	        </section>
	        <?php
	        if ($hasfrontpageblocks==1) {
	        	echo $OUTPUT->blocks('side-pre', 'span4 desktop-first-column');
	        } else {
	        	echo $OUTPUT->blocks('side-pre', 'span4 pull-right');
	        }
	        ?>
	    </div>

	    <!-- End Main Regions -->

	    <?php if (is_siteadmin()) { ?>
		<div class="hidden-blocks">
	    	<div class="row-fluid">
	        	<h4><?php echo get_string('visibleadminonly', 'theme_essential') ?></h4>
	            <?php
	                echo $OUTPUT->essentialblocks('hidden-dock');
	            ?>
	    	</div>
		</div>
		<?php } ?>


		<footer id="page-footer" class="container-fluid">
			<?php require_once(dirname(__FILE__).'/includes/footer.php'); ?>
		</footer>

	    <?php echo $OUTPUT->standard_end_of_body_html() ?>

	</div>

	<!-- Start Google Analytics -->
	<?php if ($hasanalytics) { ?>
		<?php require_once(dirname(__FILE__).'/includes/analytics.php'); ?>
	<?php } ?>
	<!-- End Google Analytics -->

	<script type="text/javascript">
	jQuery(document).ready(function() {
	    var offset = 220;
	    var duration = 500;
	    jQuery(window).scroll(function() {
	        if (jQuery(this).scrollTop() > offset) {
	            jQuery('.back-to-top').fadeIn(duration);
	        } else {
	            jQuery('.back-to-top').fadeOut(duration);
	        }
	    });

	    jQuery('.back-to-top').click(function(event) {
	        event.preventDefault();
	        jQuery('html, body').animate({scrollTop: 0}, duration);
	        return false;
	    })
	});
	</script>

	</body>
<?php endif ?>
</html>
