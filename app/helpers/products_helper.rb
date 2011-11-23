module ProductsHelper

 def link_to_new_comment(content, product, parent_id = nil)
    parent_id ||= product.root_comment
    link_to content, new_product_comment_path(product, :parent_id => parent_id)
  end
end
