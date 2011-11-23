
Product.destroy_all
Product.create!(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},  
  :price => 42.95)
# . . .
Product.create!(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :price => 49.50)
# . . .

Product.create!(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :price => 43.75)

##### Images
image_filenames = %w{ debug.jpg rtp.jpg ruby.jpg  }

Product.all.each do |product|
  image_filenames.each do |filename|
    Image.create(:file => File.new("#{Rails.root}/public/images/#{filename}"),
                 :product => product)
    break
  end
end


#***Comment***

Comment.destroy_all

Product.all.each do |product|
  parent_ids = [nil]
  10.times do |i|
    parent_ids << Comment.create!(:name => "User #{i}",
                                  :text => "Comment #{i}.\nTrololo.",
                                  :product => product,                              
                                  :parent_id => parent_ids.shuffle!.last).id
  end
end


