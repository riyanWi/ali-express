nokogiri = Nokogiri.HTML(content)

# p nokogiri

products = nokogiri.css("div.product-container div.JIIxO a._3t7zg")

products.each do |product|
    
    url = URI.join('https://www.aliexpress.com',product['href']).to_s.split('?').first
    
    
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

total_page_summary = nokogiri.css(".list-pagination")
# total_page = total_page_summary.scan(/\d+/).first.to_i
p total_page_summary
# 2.upto(10) do |i|
#     if i < 11
#         url = "https://www.aliexpress.com/category/100003109/women-clothing.html?page=#{i}"
#         pages << {
#             method: "GET",
#             fetch_type: "browser",
#             headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
#             vars: {
#                 category: "Women's clothing"
#             },
#             url:url,
#             page_type: "listings"
#         }
#     end
# end