package fr.bihar.esante

class Admin_homeTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def renderList = { attrs, body ->
        // reads the 'values' attribute from the attributes list
        def list = attrs.values
        // iterates and renders list values
        list.each {
            // uses the implicit 'out' variable to append content to the response
            out << "<span class=\"element\"> ${it} </span>"
        }
    }

}
