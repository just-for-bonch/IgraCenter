<!DOCTYPE html>
<html>
<head>
	<title>MAIN</title>
	<script src="https://vk.com/js/api/openapi.js?152" type="text/javascript"></script>
</head>
<body>
    <center>
	<div id="vk_auth"></div> <!-- ВОТ БЛОК ВИДЖЕТА ЕГО НАДО ПО ЦЕНТРУ -->
        <script type="text/javascript">
        	VK.init({
                	apiId: 6499534
                	});
      		VK.Widgets.Auth("vk_auth", {width: "30px", authUrl: 'vk_login.php?'});
    	</script>
    </center>
</body>
</html>