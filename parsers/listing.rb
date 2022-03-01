html = Nokogiri.HTML(content)

products = html.css("div.product-container div.JIIxO")

products.each do |product|
    a_element = product.at_css('a')
    if a_element
        url = URI.join('https://www.aliexpress.com',a_element['href']).to_s.split('?').first

        pages << {
            url: url,
            page_type: "product",
            fetch_type: "browser",
            force_fetch: true,
            vars:{
                category: page['vars']['category'],
            }
        }
    end 
end

total_page_summary = html.css(".total-page").text
total_page = total_page_summary.scan(/\d+/).first.to_i

2.upto(total_page) do |i|
    if i < 11
        url = "https://www.aliexpress.com/category/100003109/women-clothing.html?page=#{i}"
        pages << {
            url:url,
            page_type: "listings"
        }
    end
end