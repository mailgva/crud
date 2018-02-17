<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Books</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="/js/scripts.js"></script>

    <link rel="stylesheet"
          href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

</head>
<body>
<h3>List of Books</h3>
<a href="/" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Back to Editable style</a>
<table id="myTable" class="display" cellspacing="0" width="96%">
    <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Description</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Year</th>
                <th>Read</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Description</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Year</th>
                <th>Read</th>
            </tr>
        </tfoot>
</table>
</body>
</html>