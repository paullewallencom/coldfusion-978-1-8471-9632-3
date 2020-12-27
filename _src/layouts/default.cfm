<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<cfoutput>
<title>Object-Oriented Programming in ColdFusion</title> 
<link rel="stylesheet" 		type="text/css" media="all" href="#variables.framework.base#assets/css/style.css" /> 
	<link rel="stylesheet" 	type="text/css" media="all"	href="#variables.framework.base#assets/css/SyntaxHighlighter.css" /> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/shCore.js"></script> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/shBrushColdFusion_original.js"></script> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/shBrushXml.js"></script> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/shBrushJScript.js"></script> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/jquery-1.3.1.min.js"></script> 
	<script type="text/javascript" src="#variables.framework.base#assets/js/common.js"></script>
</cfoutput>
</head> 
<body>
<div id="wrapper"> 
	<div id="header"> 
		<div id="masthead"> 
			<div id="branding"> 
				<h1 id="site-title">Object-Oriented Programming in ColdFusion</h1> 
			</div>
 			<cfoutput>
			<div id="access" role="navigation"> 
				<div class="menu">
					<ul>
						<li><a href="#buildURL(action='main.default')#" title="Home">Home</a></li>
						<li><a href="#buildURL(action='main.code')#" title="Code Snippets">Code Snippets</a>
							<ul class='children'>
								<cfloop from="1" to="7" index="i">
								<li><a href="#buildURL(action='main.code', queryString='chapter=#i#')#" title="Chapter #i#">Chapter #i#</a></li>
								</cfloop>
							</ul>
						</li>
						<li><a href="#buildURL(action='main.sql')#" title="SQL Script">SQL Script</a>
					</ul>
				</div> 
			</div>
			</cfoutput>
		</div>
	</div>
	<div id="main"> 
		<div id="container"> 
			<div id="content" class="one-column">  								
				<cfoutput>#body#</cfoutput>
			</div>
		</div> 
	</div>
	<div id="footer" role="contentinfo"> 
		<div id="colophon"> 
			<div id="site-info"> 
				<a href="http://www.mattgifford.co.uk" title="Visit mattgifford.co.uk">www.mattgifford.co.uk</a> 
			</div>
		</div>
	</div>
</div>
</body> 
</html> 