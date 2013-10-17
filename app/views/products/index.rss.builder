xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Betastore Products"
    xml.link "http://betastore.com"
    xml.atom :link, href: "http://betastore.com/products.rss", rel: "self", type: "application/rss+xml"
    xml.description "New Products"

    for product in @products
      xml.item do
        xml.author "staff@betastore.com"
        xml.title product.name
        xml.description product.name
        xml.pubDate product.created_at.to_s(:rfc822)
        xml.link product_url(product)
        xml.guid "urn:uuid:#{product.id}", isPermaLink: "false"
      end
    end
  end
end
