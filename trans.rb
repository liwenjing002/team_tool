#encoding:utf-8
require'yaml'  
require'rubygems'  
require'ya2yaml'  
$KCODE = "u"  


# zh = YAML.load(File.open("/home/lee/dev/teambox/config/locales/zh.yml"))
# en = YAML.load(File.open("/home/lee/dev/teambox/config/locales/en.yml"))
zh = YAML.load(File.open("F:/opensource/team_tool/config/locales/zh.yml"))
en = YAML.load(File.open("F:/opensource/team_tool/config/locales/en.yml"))
# zh = YAML.load(File.open("d:/2.yml"))
# en = YAML.load(File.open("d:/1.yml"))




def mapdo mapen,mapzh
	if mapen.class.to_s == "Hash"
	 mapen.each do |k,v|
	 		 puts k
			 if mapzh.class.to_s== "Hash" and !mapzh.has_key? k
				mapzh[k]= v
			 else
				if v.class.to_s == "Hash"
			 
			 	mapdo v, mapzh[k]
				elsif v.class.to_s =="Array"
				arraydo v,mapzh[k]
				else
				# puts v
				end
			end
		end
	end
end

def arraydo array ,mapzh
array.each	do |a|
if a.class.to_s == "Hash"
 mapdo a,mapzh
end
if a.class.to_s =="Array"
	p 1
	arraydo a,mapzh
end

end
end

# p en["zh"]
# p zh["zh"]
mapdo en["en"],zh["zh"]

a = File.new("D:/3.yml","w")
a.puts zh.ya2yaml




