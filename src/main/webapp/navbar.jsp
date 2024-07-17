<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        header {
            background-color: #05203c;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            color: white;
            height: 70px;
            border-bottom: 1px solid white;
        }
        .topnav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }
        .left-links {
            display: flex;
            align-items: center;
        }
        .center-links {
            display: flex;
            justify-content: center;
            flex-grow: 1;
            align-items: center;
        }
        .right-links {
            display: flex;
            align-items: center;
        }
        .airline {
            margin-right: 20px;
            font-size: 35px;
            font-weight: bold;
            color: white;
        }
        .nav-link a, .nav-link button {
            color: white;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        .nav-link {
            margin: 0 4px;
            position: relative;
            padding: 0 16px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-family: monospace;
            font-size: 15px;
            height: 40px;
            border: 1px solid white;
        }
        .nav-link:hover {
            color: black;
            background-color: #f7d23e;
        }
        .nav-link:hover a, .nav-link:hover button {
            color: black;
        }
        .translate-button {
            margin: 0 4px;
            position: relative;
            padding: 0 16px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-family: monospace;
            font-size: 15px;
            height: 40px;
            border: 1px solid white;
            background: none;
            color: white;
            cursor: pointer;
        }
        .translate-button:hover {
            color: black;
            background-color: #f7d23e;
        }
        #google_translate_element {
            display: none;
        }

        /* Hide the Google Translate toolbar */
        .goog-te-banner-frame.skiptranslate {
            display: none !important;
        }
      

        /* Hide Google Translate logo */
        .goog-logo-link {
            display: none !important;
        }
        .goog-te-gadget {
            color: transparent !important;
        }
        .goog-te-gadget .goog-te-combo {
            color: black !important;
        }

        /* Hide the Google Translate frame */
        iframe.goog-te-banner-frame {
            display: none !important;
        }

        /* Ensure the Translate dropdown doesn't interfere with the layout */
        .goog-te-combo {
            margin-top: 10px;
            background-color: #ffffff;
        }
    </style>
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'en,te,ta,hi,kn,ml',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');

            // Wait for the Google Translate widget to fully load
            setTimeout(function() {
                const allowedLanguages = ['en', 'te', 'ta', 'hi', 'kn', 'ml'];
                const selectElement = document.querySelector('.goog-te-combo');

                if (selectElement) {
                    for (let i = 0; i < selectElement.options.length; i++) {
                        const option = selectElement.options[i];
                        if (!allowedLanguages.includes(option.value)) {
                            option.style.display = 'none';
                        }
                    }
                }
            }, 1000);
        }

        function toggleGoogleTranslate() {
            var element = document.getElementById('google_translate_element');
            var translateToggle = document.querySelector('.goog-te-combo');
            if (element.style.display === 'none' || element.style.display === '') {
                element.style.display = 'block';
                translateToggle.style.visibility = 'visible'; // Show the translate dropdown
            } else {
                element.style.display = 'none';
                translateToggle.style.visibility = 'hidden'; // Hide the translate dropdown
            }
        }

    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</head>
<body>
    <header>
        <div class="topnav">
            <div class="left-links">
                <span class="airline"><i class="fas fa-plane"></i> Airline</span>
            </div>
            <div class="center-links">
                <div class="nav-link"><a href="userhome.jsp"><i class="fas fa-home"></i> Home</a></div>
                <div class="nav-link"><a href="flightDetails_u.jsp"><i class="fas fa-plane"></i> Flight Details</a></div>
                <div class="nav-link">
                    <form id="history" action="bookinghistory" method="post">
                        <button type="submit"><i class="fas fa-history" style="padding:2px"></i> History</button>
                    </form>
                </div>
                <div class="nav-link"><a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a></div>
                <div class="nav-link">
                    <form id="details" action="viewDetails" method="post">
                        <button type="submit"><i class="fas fa-user" style="padding:2px"></i> Profile</button>
                    </form>
                </div>
            </div>
            <div class="right-links">
                <div class="nav-link">
                    <form id="logoutForm" action="logoutuser" method="get">
                        <button type="submit" class="logout-btn"><i class="fas fa-user-circle"></i> Logout</button>
                    </form>
                </div>
                <button class="translate-button" onclick="toggleGoogleTranslate()">
                    <i class="fas fa-language"></i> Translate
                </button>
                <div id="google_translate_element"></div>
            </div>
        </div>
    </header>
</body>
</html>
