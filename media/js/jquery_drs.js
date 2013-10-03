$(document).ready(function(){

var currentXML;    
//ange detta i den anropande sidan mha ett script!
//var defaultXMLPath = 'http://www.forskning.se/RSS';
    
    function parseXML( xml ) {
        if( window.ActiveXObject && window.GetObject ) {
            var dom = new ActiveXObject( 'Microsoft.XMLDOM' );
            dom.loadXML( xml );
            return dom;
        }
        if( window.DOMParser )
            return new DOMParser().parseFromString( xml, 'text/xml' );
        throw new Error( 'No XML parser available' );
    }

    function writeListItem(node)  {
        var rssLink = $(node).find('link').text();
        var rssTitle = $(node).find('title').text();
        var rssDate = $(node).find('pubDate').text();
		var rssDescription = $(node).find('description').text();
        $('<div class="item"></div>')
             .html('<a target="new" href="' + rssLink + '"><font color="black" size="1"><B>' + rssTitle + '</B></font></a><br><font color="black" size="1">' + rssDate + '</font>')
					//+'<br>' + rssDescription + '<br><br style="clear:both;" />')
             .appendTo('#contentlist');
	//contentlist är ett objekt i htmlsidan!!!
    }
     
     function writeList() {
         var xml=currentXML;
         $("div").remove(".item");
         $(xml).find('item').each(function(){
             writeListItem(this);
         }); //close each(
     }

     function loadRssList(xmlPath){
        var xml = parseXML($.ajax({ url: xmlPath,
                                    async: false
                                    }).responseText)
        var $xml = $(xml);
        currentXML=$xml;
        writeList();
    }

    //Load Default
     loadRssList(defaultXMLPath);
     
});

