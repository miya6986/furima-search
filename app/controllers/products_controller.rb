class ProductsController < ApplicationController

  def index
  end

  def search_sites
    search_num = 20
    keyword, condition = params[:keyword], params[:condition]
    minprice, maxprice = params[:minprice], params[:maxprice]
    titles = []
    prices = []
    images = []
    urls = []

    agent = Mechanize.new
    agent.user_agent_alias = 'Windows IE 11'

    # yahuoku_page = 'https://auctions.yahoo.co.jp/search/advanced?auccat=0'
    # search_page = agent.get(yahuoku_page)

    # form = search_page.forms[0]
    # form.field_with(id: 'f0v0').value = keyword
    # form.field_with(name: 'aucminprice').value = minprice
    # form.field_with(name: 'aucmaxprice').value = maxprice

    # if (condition == "all")
    #   form.radiobutton_with(id: 'istatus0').check
    # elsif (condition == "new")
    #   form.radiobutton_with(id: 'istatus1').check
    # end

    # search_result = agent.submit(form)

    # link_element = search_result.search('a.Product__titleLink')
    # prices_element = search_result.search('span.Product__priceValue')

    # link_element.each_with_index do |ele, i|
    #   href = ele[:href]
    #   item_title = ele[:title]
    #   image_url = agent.get(href)
    #   item_img = image_url.at('.ProductImage__inner img').get_attribute('src')
      
    #   titles << "#{item_title}"
    #   urls << "#{href}"
    #   images << "#{image_url}"

    #   break if i == search_num - 1
    # end
    # prices_element.each_with_index do |ele, i|
    #   item_price = ele.inner_text
    #   item_price.sub!(/円/, '')
    #   item_price.sub!(/,/, '')

    #   prices << "#{item_price}"
    #   break if i == search_num -1
    # end

    # merucari_word = "https://www.mercari.com/jp/search/?sort_order=created_desc&keyword=" + "#{keyword}"

    # if (minprice != nil && maxprice != nil)
    #   merucari_word += "&price_min=#{minprice}" + "&&price_max=#{maxprice}"
    # elsif (minprice != nil)
    #   merucari_word += "&price_min=#{minprice}"
    # elsif (maxprice != nil)
    #   merucari_word += "&price_max=#{maxprice}"
    # end

    # if (condition == 'all')
    #   merucari_word += "&condition_all=1&item_condition_id%5B1%5D=1&item_condition_id%5B2%5D=1&item_condition_id%5B3%5D=1&item_condition_id%5B4%5D=1&item_condition_id%5B5%5D=1&item_condition_id%5B6%5D=1"
    # elsif (conditon == 'new')
    #   merucari_word += "&item_condition_id%5B1%5D=1"
    # end

    # search_result = agent.get(merucari_word)

    # link_element = search_result.search('.items-box a')

    # link_element.each_with_index do |ele, i|
    #   href = ele[:href]
    #   site_element = agent.get(href)
    #   item_title = site_element.at('.item-name').inner_text
    #   item_img = site_element.at('img.owl-lazy').get_attribute('data-src')
    #   item_price = site_element.at('span.item-price').inner_text
    #   item_price.sub!(/¥/, '')
    #   item_price.sub!(/,/, '')
      
    #   titles << "#{item_title}"
    #   urls << "#{href}"
    #   images << "#{item_img}"
    #   prices << "#{item_price}"
    #   break if i == search_num - 1
    # end



    # Array.new(search_num - 1).each do |i|
    #   content = {title: :titles[i],
    #              url: :urls[i],
    #              image: :images[i],
    #              price: :prices[i]}
    #   contents << content
    # end

    rakuma_word = "https://fril.jp/search/" + "#{keyword}"

    if (minprice != nil && maxprice != nil)
      rakuma_word = "https://fril.jp/s?query=" + "##{keyword}" + "&min=" "&price_min=#{minprice}" + "&&price_max=#{maxprice}"
    elsif (minprice != nil)
      merucari_word += "&price_min=#{minprice}"
    elsif (maxprice != nil)
      merucari_word += "&price_max=#{maxprice}"
    end

    

    binding.pry
    redirect_to action: 'index'
    # respond_to do |format|
    #   format.html { redirect_to :root}
    #   format.json { render 'products', handlers: 'jbuilder'}

  end


  private

    def search_params
      params.permit(:keyword, :condition, :maxprice, :minprice)
    end
end
