nokogiri = Nokogiri.HTML(content)

p nokogiri

products = nokogiri.css("div.JIIxO")

# p products

products.each do |product|
    
    url = URI.join('https://www.aliexpress.com',product['href']).to_s.split('?').first
    
    puts url
    
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

total_page_summary = nokogiri.css(".total-page").text
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