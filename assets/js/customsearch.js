var gdata = null;

handleSearchQuery = function (query) {
    console.log("in handleSearch query and query is " + query);
    // TODO come up with a more permanent solution than jsonp.afeld.me?
    // deploy it ourselves: https://github.com/afeld/jsonp#setup
    var url = "https://jsonp.afeld.me/?callback=?&url=https://search-sciwiki-0-miwsjq2efeohp7oftsafh2ywa4.us-west-2.cloudsearch.amazonaws.com/2013-01-01/search?q=";
    url += encodeURI(query);
    url += "%26return=title";
    url += "%26highlight.content={}"
    console.log("url is");
    console.log(url);
    $.getJSON(url, function (data, b, c) {
        console.log("foiooo");
        console.log(data);
        gdata = data;
        var searchResults = $('<div id="searchresults"  style="margin-top: 100px; margin-bottom: 100px; margin-left: 80px; margin-right: 150px;" />').appendTo('body');
        if (data['hits']['found'] == 0) {
            $("#searchresults").html("No results for '" + query + "'.");
        } else {
            var hitsFound = data['hits']['found'];
            console.log("got results");
            var html = "";
            html += "<span>Found " + hitsFound + " matches for '" + query + "'.</span>\n";

            for (var i = 0; i < hitsFound; i++) {
                var hit = data['hits']['hit'][i];
                html += "<br/>\n";
                html += '<a href="' + hit['id'] + '">';
                html += hit['fields']['title'];
                html += "</a>";
                html += "<br/>\n";
                html += '<span>' + hit['highlights']['content'] + '</span><br/>\n';

            }

            $("#searchresults").html(html);

        }

        // var hilite = data['hits']['hit'][0]['highlights']['content'];
        // console.log(hilite);
        // var stuf = $('<div id="stuf"/>').appendTo('body');
        // $("#stuf").html(hilite);

    }).fail(function () {
        console.log("in error function");
    });
}

console.log("hello2");
$(function () {
    $(".search__toggle").click(function () {
        console.log("u kliked the search butten");
        $("#searchbox").remove();
        $("#searchresults").remove();
        var searchDiv = $('<input type="search" id="searchbox" aria-placeholder="Enter your search term..." class="search-input" tabindex="-1" placeholder="Enter your search term..."/>').appendTo('body');
        $("#searchbox").focus();
    });

    $("#searchbox").bind("keypress", function (event) {
        console.log("u pressed a key");
        if (event.which == 13) {
            event.preventDefault();
            console.log("u pressed enter");
            // TRIGGER YOUR FUNCTION
        }
    });

    $("#searchbox").keydown(function (e) {
        console.log("hey, a key went down");
    });


    $('body').on('keydown', '#searchbox', function (event) {
        console.log("sthg was pressed");
        if (event.keyCode == 13) {
            console.log('Enter was pressed');
            handleSearchQuery($("#searchbox").val());
        }
    });

    $("#dummysearchform").click(function () {
        console.log("in submit handler");
        return false;
    });

});



