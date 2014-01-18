icon_files = [
	{ :name => 'icon-40.png', :width => 40, :height => 40 }, 
	{ :name => 'icon-40@2x.png',:width => 80, :height => 80 }, 
	
	{ :name => 'icon-50.png', :width => 50, :height => 50 }, 
	{ :name => 'icon-50@2x.png', :width => 100,	:height => 100 }, 
	
	{ :name => 'icon-60.png', :width => 60, :height => 60 }, 
	{ :name => 'icon-60@2x.png', :width => 120, :height => 120 }, 

	{ :name => 'icon-72.png', :width => 72, :height => 72 }, 
	{ :name => 'icon-72@2x.png', :width => 144, :height => 144 }, 

	{ :name => 'icon-76.png', :width => 76, :height => 76 }, 
	{ :name => 'icon-72@2x.png', :width => 152, :height => 152 }, 

	{ :name => 'icon-small.png', :width => 29, :height => 29 }, 
	{ :name => 'icon-small@2x.png', :width => 58, :height => 58 }, 

	{ :name => 'icon.png', :width => 57, :height => 57 }, 
	{ :name => 'icon@2x.png', :width => 114, :height => 114 }
]

splash_files = [
	{ :name => 'Default-568h@2x~iphone.png', :width => 640, :height => 1136 },
	{ :name => 'Default-Landscape@2x~ipad.png', :width => 2048, :height => 1496 },
	{ :name => 'Default-Landscape~ipad.png', :width => 1024, :height => 748 },
	{ :name => 'Default-Portrait@2x~ipad.png', :width => 768, :height => 1004 },
	{ :name => 'Default-Portrait~ipad.png', :width => 2048, :height => 1496 },	
	{ :name => 'Default@2x~iphone.png', :width => 640, :height => 960 },
	{ :name => 'Default~iphone.png', :width => 320, :height => 480 }
]

type = ARGV[0]
filename = ARGV[1]
directory = 'images'

def resize_image(filename, directory, to_files, sips_arg)

	# create the directory
	puts 'creating directory...'
	`mkdir #{directory}`

	# copy and resize images
	puts 'copying and resizing images...'

	to_files.each do |file|
		new_file = directory + "/" + file[:name]
		`cp #{filename} #{new_file}`
		`sips -#{sips_arg} #{file[:width]} #{file[:width]} #{new_file}`
	end
end

# check if file exists
def check_file_exists(filename)
	if File.exist?(filename)
		puts "image #{filename} found"
	else
		abort "ERROR:  image #{filename} not found."
	end
end

# 
if type == '-i'
	check_file_exists filename
	puts 'creating icons...'
	resize_image filename, 'icons', icon_files, 'z'

elsif type == '-s'
	check_file_exists filename
	puts 'creating slash images...'
	resize_image filename, 'splash', splash_files, 'c'

else 
	abort 'Error:  must specify -i or -s'

end	
# done!