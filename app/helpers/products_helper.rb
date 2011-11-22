module ProductsHelper

  def image_for(product, resolution='60x70')
    if product.image
      img = image_tag(product.image.thumb(resolution).url,
                      {:alt => product.title})
      link_to(img, product.image.url)
    end
  end
end
