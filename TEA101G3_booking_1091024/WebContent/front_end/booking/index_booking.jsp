<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
	<meta charset="UTF-8">
</head>
<body>
<h2>Hello World!</h2>
<button onclick="window.location.href='./booking/ListManager.jsp'">Service Selection</button>
<tr>
	<td>
		<p style='font-size:16px;'>	工作方面，你的心胸寬大，懂得寬恕他人，在人際關系上獲得眾人的敬重與愛戴。你可能剛得到一份新工作不久，並在這份工作上得到成就感、實質的報酬、與充實投入的感動。;財運方面，最近額外收入頗為豐碩，規劃已久的奢侈品可以入手了！;
</p>
	</td>
</tr>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script type="text/javascript">
var txt = $('p').text();
$(document).ready(function(){	
	$('p').html(txt.replace(/;/g,'<br>\t'));
});
</script>
</body>
</html>
