products = Page.new(title:'Products', content:'This is a page')
  products.save!
  prints_and_finishing = products.children.new(title:'Prints & Finishing', content:'This is a page')
  prints_and_finishing.save!
    prints_and_finishing.children.new(title:'Photographic Prints', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    finishing_services = prints_and_finishing.children.new(title:'Finishing Services', content:'This is a page')
    finishing_services.save!
      finishing_services.children.new(title:'Mounting', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
      finishing_services.children.new(title:'Texture & Coating', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    prints_and_finishing.children.new(title:'Standout', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    prints_and_finishing.children.new(title:'Framed Prints', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
  
  press_printed = products.children.new(title:'Press Printed Cards & Products', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224')
  press_printed.save!
    press_printed.children.new(title:'Boutique Cards', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    press_printed.children.new(title:'Greeting Cards', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    press_printed.children.new(title:'Postcards', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    press_printed.children.new(title:'Business Cards', content:'This is a page', dakis_url:'http://s251946272.onlinehome.us/prodigitalphotos/gift_catalog.html?catalog[name]=Baby&catalog[category_id]=195224').save!
    

about_us = Page.new(title:'About Us', content:'This is a page')
about_us.save!
  about_us.children.new(title:'Environmental Responsibility', content:'This is a page').save!
  about_us.children.new(title:'Company History', content:'This is a page').save!
  about_us.children.new(title:'Production Facilities', content:'This is a page').save!
  about_us.children.new(title:'Our Staff', content:'This is a page').save!
  about_us.children.new(title:'Customer Service', content:'This is a page').save!

pro = Page.new(title:'Go Pro', content:'This is a page', right_nav:true).save!

# Create some users
cory = User.create!(username:'cory', password:'test', name:'Cory', is_admin:true)