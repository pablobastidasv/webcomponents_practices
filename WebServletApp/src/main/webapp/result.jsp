<html>
<head>
    <title></title>
</head>
<body>
<h1>Beer Recomendations JSP</h1>

<p>
    <%
        List styles = (List) request.getAttribute("style");

        for (Object style : styles) {
            out.print(" <br /> try: "+style);
        }
    %>
</p>
</body>
</html>
