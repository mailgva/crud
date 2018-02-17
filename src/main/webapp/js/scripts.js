$(document).ready(function() {
    $('#myTable').dataTable( {
        "ajax": {
          "url": "all",
          "dataSrc": ""
        },

        aoColumns: [
            { mData: "id" },
            { mData: "title" },
            { mData: "description" },
            { mData: "author" },
            { mData: "isbn" },
            { mData: "printYear" },
            { mData: "readAlready" }
        ],
        autofill: true,
        select: true,
        responsive: true,
        buttons: true,
        length: 10,
      } );
} );