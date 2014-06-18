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

    <?php if (!isloggedin()): ?>
	    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

		<!-- mobile meta tag -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

		<title>Top-Grader</title>

		<!-- main style -->
		<link rel="stylesheet" type="text/css" href="style.css" media="screen" />

		<!-- color scheme -->
		<link rel="stylesheet" type="text/css" href="color-schemes/orange/orange.css" media="screen" />

		<!--miscellaneous-->
		<link rel="stylesheet" type="text/css" href="css/custom-styles.css" media="screen" />
		<link rel="stylesheet" href="template-changer.css" type="text/css" />

		<!-- revolution slider settings -->
		<link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />

		<!-- responsive stylesheet -->
		<link rel="stylesheet" type="text/css" href="css/responsive.css" media="screen" />

		<!-- Google Web Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

		<!-- jQuery -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

		<!-- jQuery Scripts -->
		<script type="text/javascript" src="js/scripts-top.js"></script>

		<script type="text/javascript" src="js/template-changer.js"></script>
	<?php endif ?>
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
                <?php if (!isloggedin()): ?>
                <ul class="nav">
                <li class="brand current"><a class="brand" href="<?php echo $CFG->wwwroot;?>"><?php echo $SITE->shortname; ?></a></li>
                <li class="brand"><a href="#quote"><span>ABOUT</span></a></li>


						<li class="brand"><a href="#services"><span>K-12</span></a></li>
						<li class="brand"><a href="#projectbg"><span>Test Prep</span></a></li>
						<li class="brand"><a href="#contact"><span>CONTACT</span></a></li>
                </ul>
                <?php endif ?>
                <ul class="nav pull-right">
                    <li class="external"><?php echo $OUTPUT->page_heading_menu(); ?></li>
                    <li class="navbar-text external"><?php echo $OUTPUT->login_info() ?></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="clear"></div>

</header>
<?php if (isloggedin()): ?>
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

<?php else: ?>

	<div id="wrapper">



	<!-- About SECTION -->
	<section class="parallax-section" id="quote" style="padding-top:2%;">
		<div>
			<section class="centered-wrapper">
				<div class="space"></div>

				<h2 class="parallax-quote">"Helping Students improve grades in USA, Canada, UK, Singapore and Australia."</h2>

				<div class="space"></div>
			</section>
		</div>
	</section>

	<!-- CONTACT SECTION -->
	<section class="parallax-section" id="login">
		<div>
		<div class="centered-wrapper">
			<div class="space"></div>

			<h1 class="section-title"><span class="log-in">Log in</span> or <span class="sign-up">sign up</span></h1>

			<div class="percent-one-half box fadeInLeft rightDashBorder">
				<div id="contactform">
					<div id="message"></div>
					<form method="post" action="" name="cform" id="cform">
						<fieldset>
							<input id="name" type="text" name="username" placeholder="User Name"/>

							<input type="password" name="password" id="password" placeholder="Password"/>
						</fieldset>

						<fieldset>
							<input type="submit" name="login" value="Sign In" id="submit" class="button black"/>
						</fieldset>

					</form>
				</div><!--end contactform-->
			</div>

			<div class="percent-one-half column-last box fadeInRight">

				<a href="Twitter" class="auth-twitter">Sign in with Twitter</a>

				<a href="Twitter" class="auth-twitter">Sign in with Facebook</a>

				<a href="Twitter" class="auth-twitter">Sign in with Google</a>

				<a href="Twitter" class="auth-twitter">Sign in with OpenID</a>

			</div>

			<div class="double-space"></div>
		</div>
		</div>
	</section>

	<!-- SERVICES SECTION -->
	<section class="parallax-section" id="services">
		<div>

			<section class="centered-wrapper">

				<div class="double-space"></div>

				<h1 class="section-title"><a href="K12">K-12 Tutoring</a></h1>

				<div class="space"></div>

				<ul class="homepage-services box fadeInUp">
					<li class="dt-service-wrapper percent-one-third">
						<div class="dt-service-item">
							<i class="fa fa-plus-circle"></i>
							<h3 class="service-title">Math</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-plus-circle"></i>
							<h3>Math</h3>
							<p>Our Math tutors have advanced degrees in Math and have expertise in a wide range of topics such as:

Trigonometry,
2-D and 3-D Geometry,
Co-ordinate Geometry,
Calculus,
Statistics,
Probability,
Permutations and Combinations,
Venn Diagrams and
Integrated Reasoning

</p>
							<p><a href="" class="button black">Try Now</a></p>
						</div>
					</li>

					<li class="dt-service-wrapper percent-one-third">
						<div class="dt-service-item">
							<i class="fa fa-font"></i>
							<h3 class="service-title">English</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-font"></i>
							<h3>English</h3>
							<p>At Top Grader, our tutors know what it takes to improve your English language skills. All our tutors possess a Master degree in English and are well-versed in teaching English. You can take LIVE tutoring classes with our tutors in the following topics:

Reading Comprehension,
Critical Reading,
Essay Writing,
Creative Writing,
Poetry,
Vocabulary Building and
Grammar

</p>
							<p>Choose from our 4-Hour, 8-Hour, or 12-Hour K-12 tutoring plans. link here</p>
						</div>
					</li>

					<li class="dt-service-wrapper percent-one-third">
						<div class="dt-service-item">
							<i class="fa fa-flask"></i>
							<h3 class="service-title">Science</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-flask"></i>
							<h3>Science</h3>
							<p>The tutors at Top Grader are professional, master degree holders in Physics, Chemistry, Biology, and other scientific fields. They can help you with your homework, assignments, and learning in every science topic. Some of the topics that you can get LIVE help in are:
Laws of motion
Friction
Force
Mechanics
Thermodynamics
Work, Power, and Energy
Heat
...

</p>
							<p>You can choose from our 4-Hour, 8-Hour, or 12-Hour K-12 tutoring plans here.</p>
						</div>
					</li>


				<div class="double-space"></div>

			</section>
		</div>
	</section>

	<!-- SERVICES SECTION -->
	<section class="parallax-section" id="projectbg">
		<div>

			<section class="centered-wrapper">

				<div class="double-space"></div>

				<h1 class="section-title"><a href="TestPrep">Test Prep</a></h1>

				<div class="space"></div>

				<ul class="homepage-services box fadeInUp">
					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">SCAT</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>SCAT</h3>
							<p>8 out of 10 students enrolled with us have scored a 90+ percentile on the SCAT ! Top Grader is the pioneer in online SCAT preparation, our structured approach to testprep has helped hundreds of students ace the SCAT with 90+ percentile!</p>

						</div>
					</li>

					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">SAT</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>SAT</h3>
							<p>The SAT Reasoning Test is a 3 hours and 45 minutes test and has three divisions – Math, Critical Reading, and Writing.</p>
						</div>
					</li>

					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">ACT</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>ACT</h3>
							<p>The ACT, like SAT is a standardized test for assessment of college readiness of students for undergraduate courses in the United States. The ACT consists of four multiple-choice sections of English, Math, Reading, and Science.</p>

						</div>
					</li>

					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">GRE</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>GRE</h3>
							<p>The GRE tutors at Top Grader have had Math and English Language as their favourite subject in their undergraduate and Master courses. They are well-versed with the GRE test structure, topics tested, and the strategies that can improve a student’s scores on the test.</p>

						</div>
					</li>

					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">GMAT</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>GMAT</h3>
							<p>Like GRE, our GMAT tutors are experts in Math and Critical Reasoning. Some of the GMAT tutors are senior professionals with several years of experience teaching Math Reasoning at top test preparation coaching institutes for business schools.</p>

						</div>
					</li>
					<li class="dt-service-wrapper percent-one-sixth">
						<div class="dt-service-item">
							<i>&nbsp</i>
							<h3 class="service-title">Other Test Prep</h3>
						</div>
						<div class="dt-service-hover">
							<i class="fa fa-book"></i>
							<h3>Other Test Prep</h3>
							<p>Top Grader also helps students prepare for other well know standardized tests such as the NJ ASK, FCAT, ISAT, STAR, TAKS, TERRANOVA, HSPT, etc.</p>

						</div>
					</li>


				<div class="double-space"></div>

			</section>
		</div>
	</section>


	<!-- TESTIMONIALS SECTION -->
	<section id="testimonials" class="clear">
		<section class="centered-wrapper">
			<div class="double-space"></div>

			<h1 class="section-title">Testimonials</h1>
			<div class="space"></div>

			<div class="testimonials-carousel">
				<div id="owl-testimonials" class="owl-carousel box fadeInDown">
					<div class="testimonial-item">
						<p>Top Grader helped me get 90 percentile in SCAT. The website is great. </p>
						<p><span class="testimonial-name">JOHN DOE</span>, <span class="testimonial-position">Company CEO</span></p>
					</div>
					<div class="testimonial-item">
						<p>We have been very much impressed by Patti Studio. They grasped our needs and produced a stunning design. Needless to say we are extremely satisfied with the results. Thank you!â€�</p>
						<p><span class="testimonial-name">ELENA GONZALES</span>, <span class="testimonial-position">Envato Team</span></p>
					</div>
					<div class="testimonial-item">
						<p>The work they made impressed me on multiple levels. I have been very happy about the whole process and they have done a great job. They was fast to deliver new ideas and always helpful with our questions!â€�</p>
						<p><span class="testimonial-name">RICHARD BRENNAN</span>, <span class="testimonial-position">Linda Marketing Team</span></p>
					</div>
				</div>
			</div><!--end carousel-->
			<div class="double-space"></div>
		</section>
	</section>

	<!-- CONTACT SECTION -->
	<section class="parallax-section" id="contact">
		<div>
		<section class="centered-wrapper">
			<div class="double-space"></div>

			<h1 class="section-title">Contact US</h1>
			<div class="space"></div>
			<div class="percent-one-half box fadeInLeft">
				<h3 class="title-bg"><span>Contact Info</span></h3>
				<ul class="contact-info">
					<li><i class="fa fa-map-marker"></i>

							Top Grader India Ltd<br/>
							2 Fawn Brake Avenue<br/>
							S.N. Marg<br/>
							Lucknow 226001<br/>
							India<br/>

					</li>
					<li><i class="fa fa-phone"></i>1800-626-9803</li>
					<li><i class="fa fa-envelope"></i><a href="mailto:">info@top-grader.com</a></li>
				</ul>
			</div>

			<div class="percent-one-half column-last box fadeInRight">
				<div id="contactform">
					<div id="message"></div>
					<form method="post" action="" name="cform" id="cform">
						<fieldset class="percent-one-half">
							<input id="name" type="text" name="name" placeholder="Name"/>
						</fieldset>
						<fieldset class="percent-one-half column-last">
							<input type="email" name="email" id="email" placeholder="Email"/>
						</fieldset>
						<fieldset class="clean">
							<textarea name="comments" id="comments" placeholder="Message"></textarea>
						</fieldset>
						<fieldset>
							<input type="submit" name="send" value="SEND" id="submit" class="button black"/>
						</fieldset>
					</form>
				</div><!--end contactform-->
			</div>

			<div class="double-space"></div>
		</section>
		</div>
	</section>


</div><!--end wrapper-->

	<!-- JQUERY SCRIPTS -->

	<script type="text/javascript" src="twitter/jquery.tweet.min.js"></script>
	<script type="text/javascript" src="js/jquery.contact.js"></script>

	<script type="text/javascript" src="js/scripts-bottom.js"></script>


	<!-- ISOTOPE -->
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/custom-isotope.js"></script>

	<!-- REVOLUTION SLIDER -->
	<script type="text/javascript" src="rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript" src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="js/custom-revolution.js"></script>

	<!-- CUSTOM -->
	<script type="text/javascript" src="js/custom.js"></script>
<?php endif ?>

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
</html>
