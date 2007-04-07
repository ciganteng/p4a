<?php
	if (isset($menu) and isset($top)) {
		$_top_margin = 70;
	} elseif (isset($menu)) {
		$_top_margin = 25;
	} elseif (isset($top)) {
		$_top_margin = 45;
	} else {
		$_top_margin = 0;
	}

	echo $_xml_header;
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?php echo $_charset?>" />
<title><?php echo $_title?></title>

<?php foreach ($_javascript as $_k=>$_v): ?>
<script type="text/javascript" src="<?php echo $_k?>"></script>
<?php endforeach; ?>

<?php foreach ($_css as $_url=>$_media): ?>
<link href="<?php echo $_url?>" rel="stylesheet" type="text/css" media="<?php echo join(', ', array_keys($_media))?>"></link>
<?php endforeach; ?>
</head>

<body onload="setFocus('<?php echo $_focus_id?>');hideLoading();">
<div id='body'>
<div id='p4a_loading'><img src='<?php echo P4A_ICONS_PATH?>/loading.gif' alt='' /> Loading... </div>
<?php echo $this->maskOpen()?>

<?php if (isset($sidebar_left)): $_sidebar_left_width='280';?>
<div id="sidebar_left" class="border_color4 background_box" style="padding-top:<?php echo $_top_margin+10?>px; width:<?php echo $_sidebar_left_width?>px;">
	<?php echo $sidebar_left?>
</div>
<?php endif; ?>

<?php if (isset($sidebar_right)):  $_sidebar_right_width='280';?>
<div id="sidebar_right" class="border_color4 background_box" style="padding-top:<?php echo $_top_margin+10?>px; width:<?php echo $_sidebar_right_width?>px;">
	<?php echo $sidebar_right?>
</div>
<?php endif; ?>

<!-- TOP -->
<div id="topContainer">
	<?php if (isset($menu)): ?>
	<div id="menu">
		<?php echo $menu?>
		<div class="br"></div>
	</div>
	<?php endif; ?>

	<?php if (isset($top)): ?>
	<div id="top" flexy:if="top">
		<?php echo $top?>
	</div>
	<?php endif; ?>
</div>

<!-- MAIN  -->
<div id="mainContainer" style="margin-top:<?php echo $_top_margin?>px; <?php if (isset($_sidebar_left_width)) echo "margin-left:{$_sidebar_left_width}px;"?> <?php if (isset($_sidebar_right_width)) echo "margin-right:{$_sidebar_right_width}px;"?>">
	<?php if (strlen($_title)): ?>
	<h2><?php echo $_icon . $_title?></h2>
	<?php endif; ?>

	<?php if (isset($main)): ?>
	<div id="sheetContainer">
		<?php echo $main?>
	</div>
	<?php endif; ?>

	<!-- The following line is a copyright note, you've to keep it as is, we think it's a small price for P4A. -->
	<div id="footerContainer">Powered by <a href="http://p4a.sourceforge.net/welcome">P4A - PHP For Applications</a></div>
</div>

<!-- POPUP -->
<div id="overlay" style="display:none"></div>
<div style="display:block"><div id="popup" style="display:none"><?php echo $_popup?></div></div>

<?php echo $this->maskClose()?>
</div>

<?php if (strlen($_popup)): ?>
<script type="text/javascript">
showPopup();
</script>
<?php endif; ?>

</body>
</html>