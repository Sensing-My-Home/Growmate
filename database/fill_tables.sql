INSERT INTO public.utilizador (id, email, name, password, user_type)
VALUES
    (1, 'admin@email.com', 'admin', 'password123', 0);

INSERT INTO public.utilizador (id, address, dob, email, name, password, rating, user_type)
VALUES
    (2, '123 Main St', '1990-01-01', 'john.doe@example.com', 'John Doe', '$2a$10$3ScENDnVbvrmcpRA4jn0p.eXSmg2vSWJqLBIVcRz14bwo5lWniK82', 4, 2),
    (3, '123 Main St', '1990-01-01', 'john.doe.poor@example.com', 'John Doe Poor', '$2a$10$3ScENDnVbvrmcpRA4jn0p.eXSmg2vSWJqLBIVcRz14bwo5lWniK82', 4, 1);;

INSERT INTO public.species_family (id, name, difficulty, opt_soil_mix, photo)
VALUES
    (1, 'Flowering House Plants', 3, 1, 'https://assets.hgtv.ca/wp-content/uploads/2021/12/Kalanchoe-Plants-That-Flower-In-Winter-FT.jpg'),
    (2, 'Foliage Plants', 2, 2, 'https://www.gardendesign.com/pictures/images/675x529Max/site_3/colorful-foliage-plants-proven-winners_16616.jpg'),
    (3, 'Bromeliads', 3, 3, 'https://www.gardeningknowhow.com/wp-content/uploads/2012/03/bromeliads-1.jpg'),
    (4, 'Orchids', 5, 4, 'https://www.allaboutgardening.com/wp-content/uploads/2021/11/Types-of-Orchids-1200x667.jpg'),
    (5, 'Succulents and Cacti', 1, 5, 'https://buchanansplants.com/wp-content/uploads/2022/03/iStock-1302750927-scaled.jpg'),
    (6, 'Ferns', 3, 6, 'https://cdn.britannica.com/30/73130-138-917E422E/Ferns-systems-tracheophytes-leaves-water.jpg?w=800&h=450&c=crop'),
    (7, 'African Violets and other Gesneriads', 3, 7, 'https://bloximages.chicago2.vip.townnews.com/auburnpub.com/content/tncms/assets/v3/editorial/0/80/08049aee-ea8b-5f5d-9a01-ae3d6f27cc7a/601c64139816c.image.jpg');

INSERT INTO public.plant_species (id, common_name, cycle, flowering, leaf_color, optimal_humidity, optimal_luminosity, optimal_temperature, scientific_name, season, photo, usual_size, watering_frequency, family_id)
VALUES 
(1, 'Chenile Plant', 'Annual', true, 'green', 2, 4, 2, 'Acalypha hispida', 3, 'https://bs.plantnet.org/image/o/3c47e1574ef9846ae1782095a4252a112dc7c260', 180, 2, 1),
(2, 'Magic Flower', 'Perennial', true, 'brown, green', 2, 3, 2, 'Achimenes hybrids', 3, 'https://www.pacificbulbsociety.org/pbswiki/files/Achimenes/Achimenes_George_Houche_JS1.jpg', 60, 3, 7),
(3, 'Sweet Flag', 'Herbaceous Perennial', false, 'green', 2, 3, 2, 'Acorus calamus', 2, 'https://www.everwilde.com/media/0800/FACOCAL-A-Sweet-Flag-Seeds.jpg', 15, 3, 2),
(4, 'Miniature Sweet Flag', 'Herbaceous Perennial', false, 'green', 2, 3, 2, 'Acorus gramineus', 2, 'https://bs.plantnet.org/image/o/718ec737b1f6d56d3d0c80fe35159a6b4f235532', 30, 3, 2),
(5, 'Maidenhair Fern', 'Perennial', false, 'green', 3, 3, 2, 'Adiantum raddianum', 3, 'https://bs.plantnet.org/image/o/d99f32069b2026811bc17a570caacbb3f4d5619f', 60, 3, 6),
(6, 'Crinkle-Leaf Plant', 'Perennial', true, 'green', 2, 3, 2, 'Adromischus cristatus', 3, 'https://bs.plantnet.org/image/o/d0bab3c3f55fc00385d17406f79a374810dd0794', 40, 2, 5),
(7, 'Plover Eggs', 'Perennial', true, 'dark green, red', 2, 3, 2, 'Adromischus festivus', 3, 'https://bs.plantnet.org/image/o/4a8ad823c447c0f1aa4506e5d182ac29b5908111', 7, 2, 5),
(8, 'Silver Vase', 'Perennial', true, 'green, gray', 2, 3, 2, 'Aechmea fasciata', 3, 'https://bs.plantnet.org/image/o/94dfbdb180cdb4ade23822f3f25bcc98319cd9ce', 30, 2, 3),
(9, 'Purplish Coral Berry', 'Perennial', true, 'evergreen', 2, 3, 2, 'Aechmea miniata "Discolor"', 3, 'https://bs.plantnet.org/image/o/d6acfff3dce6cac2fc0c32fe6a38abcbc0354fab', 30, 2, 3),
(10, 'Royal Wine Bromeliad', 'Perennial', true, 'purple, wine, green', 2, 3, 2, 'Aechmea ‘Royal Wine’', 3, 'https://garden.org/pics/2019-09-17/yowie/fc79c7.jpg', 70, 3, 3),
(11, 'Zebra Basket Vine', 'Perennial', true, 'green', 2, 3, 2, 'Aeschynanthus marmoratus', 2, 'https://bs.plantnet.org/image/o/5b8b39e67c8b6307efe74d5c43ea6a2a51a284c3', 120, 3, 7),
(12, 'Lipstick Vine', 'Perennial', true, 'green, purple', 2, 3, 2, 'Aeschynanthus pulcher', 3, 'https://bs.plantnet.org/image/o/72aad0e6fb538b114d9f9888d63c220659f1abdd', 100, 3, 7),
(13, 'Variegated Century Plant', 'Herbaceous Perennial', false, 'yellow, green', 1, 4, 2, 'Agave Americana ‘Marginata’', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/agave_americana_yellow_ribbons_faroutflora_ccbyncnd20.jpg', 300, 1, 5),
(14, 'Queen Agave', 'Herbaceous Perennial', false, 'green', 2, 4, 2, 'Agave victoriae-reginae', 3, 'https://bs.plantnet.org/image/o/2722c4a4e6f864e2cb58ca78e1b16f2f41552149', 40, 2, 5),
(15, 'Chinese Evergreen', 'Herbaceous Perennial', true, 'drak green, light green', 2, 2, 2, 'Aglaonema modestum', 1, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Aglaonema_modestum_-_I7kd7ThMSZRH.jpg', 900, 2, 2),
(16, 'Silver King', 'Perennial', false, 'green, grey', 2, 2, 2, 'Aglaonema ‘Silver King’', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Aglaonema_nitidum_1_3lDOLqrehrph.jpeg', 60, 2, 2),
(17, 'Silver Queen', 'Perennial', false, 'green, grey', 2, 2, 2, 'Aglaonema ‘Silver Queen’', 4, 'https://bs.plantnet.org/image/o/fe940fcd790c883e1b8d9e96548a490e7294ccaa', 80, 2, 2),
(18, 'Allamanda', 'Perennial', true, 'dark green', 3, 4, 2, 'Allamanda cathartica', 3, 'https://bs.plantnet.org/image/o/dcf3f9c5785f2e7ddde98e492e3f3c19557c87ce', 300, 2, 1),
(19, 'Miniature Pouch Flower', 'Perennial', true, 'light green', 3, 3, 2, 'Alloplectus nummularia', 4, 'http://gesneriads.info/wp-content/uploads/2015/11/1277.jpg', 30, 3, 7),
(20, 'Candelabra Plant', 'Perennial', true, 'green', 1, 4, 3, 'Aloe aborescens', 3, 'https://www.jardineiro.net/wp-content/uploads/2011/05/aloe_arborescens.jpg', 60, 1, 5),
(21, 'Medicine Plant', 'Herbaceous Perennial', false, 'green, dark green', 1, 4, 3, 'Aloe vera', 3, 'https://bs.plantnet.org/image/o/170cc12d490078fc218c45d6ea2f76546b44d416', 60, 1, 5),
(22, 'Brevifolia Aloe', 'Herbaceous Perennial', false, 'green, dark green', 1, 4, 3, 'Aloe brevifolia', 3, 'https://bs.plantnet.org/image/o/c65c94ff359fef340fee9ef1bd90b72808883a79', 30, 1, 5),
(23, 'Pineapple', 'Perennial', true, 'gray, green, red', 2, 4, 2, 'Ananas comosus', 3, 'https://bs.plantnet.org/image/o/863fd4215e55ca1067808f44115724a20cf8a72a', 120, 3, 3),
(24, 'Dwarf Crystal Anthurium', 'Herbaceous Perennial', false, 'green, light green veins', 3, 3, 2, 'Anthurium clarinervium', 2, 'https://bs.plantnet.org/image/o/948397289d9601e81d22d717d6f9f679c92c0f51', 100, 3, 2),
(25, 'Bird’s Nest Anthurium', 'Herbaceous Perennial', true, 'dark green', 3, 3, 2, 'Anthurium hookeri', 2, 'https://bs.plantnet.org/image/o/e1e78dca0c287618d21eefb4b0c637e8893e4bee', 90, 3, 2),
(26, 'Flamingo Flower', 'Herbaceous Perennial', true, 'green', 3, 3, 2, 'Anthurium scherzeranum', 2, 'https://bs.plantnet.org/image/o/660ad59941a8f15ebb325b60e52d16830b516ddb', 45, 3, 6),
(27, 'Zebra Plant', 'Perennial', true, 'green, white', 2, 3, 2, 'Aphelandra squarrosa', 2, 'https://bs.plantnet.org/image/o/28e1c58ba1b0b74764d193c73e728f12d0f710bd', 180, 3, 2),
(29, 'Ardisia', 'Woody Perennial', true, 'green', 2, 3, 2, 'Ardisia crenata', 3, 'https://i.pinimg.com/280x280_RS/fe/81/ee/fe81eeac96beee026b340749b66bc3e6.jpg', 180, 3, 2),
(30, 'Plume Asparagus', 'Perennial', true, 'green', 2, 3, 2, 'Asparagus densiflorus ‘Myers’', 2, 'https://www.cowellsgc.co.uk/files/images/webshop/asparagus-myersii-1536x1536-61f2869ab3d57_l.webp', 70, 2, 2),
(31, 'Foxtail Fern', 'Perennial', true, 'green', 2, 3, 2, 'Asparagus densiflorus ‘Sprengeri’', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4iby2fl_vZTPjtXZ_Nf_4_SE_uPhFnORqWEfHP2tZwQ&s', 25, 2, 2),
(32, 'Sickle Thorn', 'Perennial', true, 'green', 2, 3, 2, 'Asparagus falcatus', 2, 'https://www.germigarden.com/16832-thickbox_default/asparagus-falcatus.jpg', 700, 2, 2),
(33, 'Cast Iron Plant', 'Herbaceous Perennial', false, 'green, red, purple, white', 1, 2, 2, 'Aspidistra elatior', 3, 'https://bs.plantnet.org/image/o/8c70a94b1f878ba5954bfc97808f9c17570090d5', 90, 2, 2),
(34, 'Mother Fern', 'Herbaceous Perennial', false, 'green', 2, 2, 2, 'Asplenium daucifolium', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Asplenium_daucifolium_-_Berlin_Botanical_Garden_-_IMG_8708.JPG/280px-Asplenium_daucifolium_-_Berlin_Botanical_Garden_-_IMG_8708.JPG', 100, 3, 6),
(35, 'Bird’s Nest Fern', 'Perennial', false, 'green', 2, 2, 2, 'Asplenium nidus', 1, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Asplenium_nidus_in_container_Forest_and_Kim_Starr_ccby2.0.jpg', 150, 3, 6),
(36, 'Bishop’s Cap', 'Perennial', true, 'green', 1, 3, 2, 'Astrophytum myriostigma', 3, 'https://bs.plantnet.org/image/o/9fa9ba26d68784bce8bf3ae936638e0990255ea1', 20, 1, 5),
(37, 'Flowering Maple', 'Annual', true, 'yellow, green', 2, 4, 1, 'Abutilon hybridum', 2, 'https://jb.utad.pt/imagem/11698', 300, 2, 1),
(38, 'Cuban Holly', 'Perennial', true, 'green', 2, 3, 2, 'Begonia cubensis', 2, 'https://bs.plantnet.org/image/o/026b693c1dfba965c244c37f210d81550efb30bd', 60, 2, 2),
(39, 'Metallic Leaf Begonia', 'Herbaceous Perennial', true, 'gray, green, red', 2, 3, 2, 'Begonia incarnata', 4, 'https://bs.plantnet.org/image/o/7810c89573338b58d7f3cc026f40021f14d9cc9d', 30, 2, 2),
(40, 'Rex Begonia', 'Perennial', false, 'silver, purple, pink, red, green, black', 2, 3, 2, 'Begonia x rex-cultorum', 2, 'https://www.thespruce.com/thmb/nhzoHBaxjqk_efMHGN-lIjCG7-k=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/grow-rex-begonia-1902492-3-f640ab199410402da1fe0af10ce29d63.jpg', 45, 2, 2),
(41, 'Wax Begonia', 'Annual', true, 'brown, green', 2, 4, 1, 'Begonia semperflorens', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Begonia_semperfloren_JJ1UVkWTyxoS.jpe', 60, 2, 1),
(42, 'Queen’s Tears', 'Perennial', true, 'dark green', 2, 3, 2, 'Billbergia nutans', 2, 'https://bs.plantnet.org/image/o/086b33e1b196d08af75109812dadf631f625d70c', 40, 2, 3),
(43, 'Urn Plant', 'Perennial', true, 'green', 2, 3, 2, 'Billbergia pyramidalis', 3, 'https://bs.plantnet.org/image/o/754a688e3d966d9af092299a18df07b53a039d52', 75, 2, 3),
(44, 'Zebra Plant', 'Perennial', true, 'green, white', 2, 3, 2, 'Billbergia zebrina', 3, 'https://cdn.shortpixel.ai/spai/q_lossy+ret_img+to_auto/https://houseplantalley.com/wp-content/uploads/2023/03/billbergia-in-pot-892x1024.jpeg', 60, 2, 3),
(45, 'Bougainvillea', 'Perennial', true, 'green', 1, 4, 2, 'Bougainvillea spectabilis', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Bougainvillea_flower_ltUqxe8X3SW3.jpg', 200, 1, 1),
(46, 'Schefflera', 'Perennial', true, 'green', 2, 3, 2, 'Schefflera actinophylla', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Schefflera_actinophy_9MIlQhevAQFj.jpe', 1500, 2, 2),
(47, 'Dwarf Schefflera', 'Woody Perennial', true, 'green', 2, 3, 2, 'Brassaia arboricola', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Schefflera_arboricol_NW4JXPzA3hkb.jpe', 100, 2, 2),
(48, 'Caladium', 'Annual', false, 'gray, green, pink, red, white', 3, 3, 2, 'Caladium spp.', 1, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Copy_of_Caladium-cra_aHi3eQvW5CUs.jpeg', 60, 3, 2),
(49, 'Rattlesnake Plant', 'Perennial', false, 'green, dark green', 2, 3, 2, 'Calathea insignis', 3, 'https://bs.plantnet.org/image/o/92c6c8cb43e57a9e0143ed76d85264a5c9650cec', 60, 3, 2),
(50, 'Peacock Plant', 'Perennial', false, 'green, black, dark green', 2, 3, 2, 'Calathea makoyana', 2, 'https://bs.plantnet.org/image/o/021b8c6528eda9f972385e777402ecd4e44c4931', 60, 3, 2),
(51, 'Miniature Maranta', 'Herbaceous Perennial', false, 'green, pink', 2, 3, 2, 'Calathea micans', 2, 'https://cdn.accentuate.io/589052772572/1667469445837/Calathea-rattlesnake--hyde-planter.png', 45, 3, 2),
(52, 'Rose Calathea', 'Perennial', false, 'pink, green, dark green, red', 2, 3, 2, 'Calathea roseopicta', 3, 'https://bs.plantnet.org/image/o/712fb564cb557c6da8f2d8ac71640961cf647032', 60, 3, 2),
(53, 'Slipperwort', 'Annual', true, 'green', 3, 3, 1, 'Calceolaria crenatiflora', 3, 'https://bs.plantnet.org/image/o/cc65310f1d3d248c623c03fc2adc73998333d949', 90, 3, 1),
(54, 'Striped Inch Plant', 'Herbaceous Perennial', true, 'green, white', 2, 3, 2, 'Callisia elegans', 2, 'https://thumbs.dreamstime.com/b/callisia-elegans-plant-striped-green-white-leaves-58067235.jpg', 17, 2, 2),
(55, 'Bonsai Natal Plum', 'Woody Perennial', true, 'brown, green', 2, 4, 2, 'Carissa grandiflora ‘Bonsai’', 3, 'https://my.chicagobotanic.org/wp-content/uploads/Bonsai-in-semitropical-greenhouse-featured.jpg', 60, 2, 1),
(56, 'Boxwood Beauty', 'Woody Perennial', true, 'brown, green', 2, 4, 2, 'Carissa grandiflora ‘Boxwood Beauty’', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Carissa_macrocarpa_B_SdpC4eHA4oQC.jpg', 120, 2, 1),
(58, 'Madagascar Periwinkle', 'Annual', true, 'green', 3, 4, 2, 'Catharanthus roseus', 3, 'https://bs.plantnet.org/image/o/6360f0da80e1c2636176c9012309add0c14c9365', 45, 2, 1),
(59, 'Peruvian Apple Cactus', 'Perennial', false, 'green', 1, 4, 2, 'Cereus peruvianus', 3, 'https://bs.plantnet.org/image/o/55665710fc323fa0f8c52a2fe9d682087d8dfcf1', 90, 1, 5),
(60, 'Rosary Vine', 'Perennial', false, 'green', 2, 3, 2, 'Ceropegia woodii', 3, 'https://www.sasinteriors.net/wp-content/uploads/2020/10/Ceropegia-Woodii-4.jpg', 400, 2, 5),
(61, 'Parlor Palm', 'Perennial', false, 'green', 2, 2, 2, 'Chamaedorea elegans', 4, 'https://bs.plantnet.org/image/o/150658efc5ecb45887fffcc918fb3432b893a1ac', 230, 2, 2),
(62, 'Bamboo Palm', 'Woody Perennial', false, 'dark green', 2, 2, 2, 'Chamaedorea seifrizii', 3, 'https://bs.plantnet.org/image/o/c1727abff447db3c5db9857f343f61272880c0a1', 200, 2, 2),
(65, 'Variegated Spider Plant', 'Perennial', true, 'green, white', 2, 3, 2, 'Chlorophytum comosum ‘Variegatum’', 4, 'https://bs.plantnet.org/image/o/b8a8307ca3ae5e12cf13458c88b343d951dbb0f4', 60, 3, 2),
(66, 'Spider Plant', 'Perennial', true, 'green, white', 2, 3, 2, 'Chlorophytum comosum ‘Vittatum’', 4, 'https://www.picturethisai.com/wiki-image/1080/236793036073041920.jpeg', 45, 3, 2),
(67, 'Areca Palm', 'Perennial', false, 'green, gold', 2, 3, 2, 'Chrysalidocarpus lutescens', 4, 'https://bs.plantnet.org/image/o/aa33a15f613ee0d5161dc43d5e7d9a16a933047b', 100, 3, 2),
(68, 'Chrysanthemum', 'Herbaceous Perennial', true, 'green', 2, 4, 2, 'Chrysanthemum morifolium', 2, 'https://plantsrescue.com/wp-content/uploads/2013/06/Chrysantheium-morifolium.jpg', 60, 3, 1),
(69, 'Kangaroo Vine', 'Perennial', true, 'dark green', 2, 3, 2, 'Cissus antarctica', 3, 'https://bs.plantnet.org/image/o/9a8eb95f28ff5ab65d2380099df881c248baeb8c', 250, 2, 2),
(70, 'Grape Leaf Ivy', 'Annual', false, 'dark green', 2, 3, 2, 'Cissus rhombifolia', 1, 'https://bs.plantnet.org/image/o/d470b1d01c883765e5b64bcfaeb0aa75c36c8060', 250, 2, 2),
(71, 'Wax Cissus', 'Perennial', true, 'green', 1, 3, 2, 'Cissus rotundifolia', 2, 'https://bs.plantnet.org/image/o/06d7cc1e8366fec152a469982dabea45e554b5f2', 200, 1, 2),
(72, 'Miniature Grape Ivy', 'Perennial', true, 'green, white', 2, 3, 2, 'Cissus striata', 2, 'https://cdn.shopify.com/s/files/1/0069/7299/7717/articles/skotselrad-cissus-striata-400092_400x.jpg', 300, 2, 2),
(74, 'Kafir Lily', 'Herbaceous Perennial', true, 'dark green', 2, 3, 2, 'Clivia miniata ‘Grandiflora’', 1, 'https://smartgardenguide.com/wp-content/uploads/2019/12/clivia-care-1-768x512.jpg', 45, 2, 1),
(75, 'Croton', 'Annual', false, 'brown, green', 3, 4, 2, 'Codiaeum variegatum', 3, 'https://bs.plantnet.org/image/o/9e4baed8777053a32af8df02bd1009d63b99e91c', 60, 3, 2),
(76, 'Coffee', 'Woody Perennial', true, 'green', 2, 3, 2, 'Coffea arabica', 2, 'https://www.thespruce.com/thmb/v9CDI5CzCF4orK4GBCax08zvGqU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1174305372-718fb182f53b4714bd0789d8a312d66f.jpg', 120, 2, 1),
(77, 'Coleus', 'Annual', true, 'brown, gold, green, orange, pink, purple, red, white', 2, 3, 2, 'Coleus blumeri', 2, 'https://bs.plantnet.org/image/o/074429d98f5ad8e4d792cd856900d26e485798a8', 20, 2, 1),
(78, 'Goldfish Plant', 'Perennial', true, 'green', 3, 3, 2, 'Colummea hybrids', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Columnea_microphylla_1.jpg/220px-Columnea_microphylla_1.jpg', 30, 3, 7),
(79, 'Ti Plant', 'Perennial', false, 'green, pink, red, purple', 2, 3, 1, 'Cordyline terminalis', 2, 'https://bs.plantnet.org/image/o/bf0103b99f91a14017dfdd613e12e4b24366ba5e', 80, 2, 2),
(80, 'Jade Plant', 'Perennial', true, 'green, red', 2, 3, 2, 'Crassula argentea', 1, 'https://bs.plantnet.org/image/o/40bd936de78fbfeefa4fbd17acfbb08c2271af64', 90, 2, 2),
(81, 'Propeller Plant', 'Perennial', true, 'gray, green', 2, 4, 2, 'Crassula falcata', 2, 'https://thegardeningcook.com/wp-content/uploads/2021/01/propeller-plant-main.jpg', 30, 1, 5),
(82, 'Arab’s Turban', 'Perennial', true, 'green, red', 2, 4, 2, 'Crassula hemisphaerica', 2, 'https://www.giromagicactusandsucculents.com/wp-content/uploads/2022/05/crassula-hemispaherica-2.jpg', 10, 1, 5),
(83, 'Toy Cypress', 'Perennial', true, 'green', 2, 4, 2, 'Crassula lycopodioides', 2, 'https://worldofsucculents.com/wp-content/uploads/2017/05/Crassula-muscosa-Watch-Chain-Princess-Pine5.jpg', 30, 2, 5),
(84, 'Red Flowering Crassula', 'Perennial', true, 'pink, red, brown, green', 2, 3, 2, 'Crassula schmidtii', 3, 'https://plantasflores.net/wp-content/uploads/2021/11/Crassula-exilis-schmidtii.jpg', 20, 2, 5),
(85, 'Rattlesnake Tail', 'Perennial', true, 'green, purple, brown', 1, 3, 2, 'Crassula teres', 3, 'https://bs.plantnet.org/image/o/ced5d80e063f177bb9aed65c5a331b0103954ca9', 30, 1, 5),
(86, 'Crossandra', 'Annual', true, 'blue, green', 2, 3, 2, 'Crossandra infundibuliformis', 4, 'https://bs.plantnet.org/image/o/4b0d40d738436c2a07d79c16476a0cf7e214e761', 70, 3, 1),
(87, 'Dwarf Rose Stripe Star', 'Perennial', false, 'green, pink, red, white', 2, 3, 2, 'Cryptanthus bivittatus ‘Minor’', 4, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Earth_Star_Cryptant_Usreskf0FGK0.jpeg', 15, 2, 3),
(88, 'Stiff Pheasant Leaf', 'Perennial', true, 'green, brown, pink, red', 2, 3, 2, 'Cryptanthus fosteranus', 2, 'http://world-population.net/house_plants/script/images/89.jpg', 15, 2, 3),
(89, 'Zebra Plant', 'Perennial', true, 'green, brown, pink, red', 2, 3, 2, 'Cryptanthus zonatus', 3, 'https://bs.plantnet.org/image/o/2b7c6487b0301cb0e368887f929a8bcb36a90fd6', 30, 2, 3),
(90, 'House Holly Fern', 'Perennial', false, 'green', 2, 3, 2, 'Cyrtomium falcatum ‘Rochfordianum’', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Cyrtomium_falcatum-Growth_pattern-Stan_Sheb-CC_BY-SA_3.0.jpeg', 60, 2, 6),
(91, 'Rabbit’s Foot Fern', 'Perennial', false, 'gray, green', 3, 3, 2, 'Davallia fejeensis', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Davallia_fejeensis_c_Ri1OpiZfcwIG.jpeg', 60, 3, 3),
(92, 'Exotica Perfection', 'Perennial', false, 'dark green, green, white', 2, 3, 2, 'Dieffenbachia ‘Exotica Perfection’', 2, 'https://www.houseplantsexpert.com/wp-content/uploads/2022/09/dieffenbachia_amoena.jpg', 90, 2, 2),
(93, 'Spotted Dumb Cane', 'Perennial', false, 'gold, green, white', 2, 2, 2, 'Dieffenbachia maculata', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Dieffenbachia_macula_JqoJJmjGxYWG.jpe', 90, 2, 2),
(94, 'False Aralia', 'Perennial', false, 'gold, green', 2, 3, 2, 'Dizygotheca elegantissima', 1, 'https://upload.wikimedia.org/wikipedia/commons/6/64/Schefflera_elegantissima.jpg', 120, 2, 2),
(95, 'Janet Craig', 'Perennial', false, 'green', 2, 3, 2, 'Dracaena deremensis ‘Janet Craig’', 3, 'https://cdn.shopify.com/s/files/1/0050/6150/9155/products/Dracaena_Janet_Craig_P21_100cm_2048x.jpg', 140, 2, 2),
(96, 'Warneckii', 'Perennial', false, 'green', 2, 3, 2, 'Dracaena deremensis ‘Warneckii’', 3, 'https://bs.plantnet.org/image/o/76fd49d0e59be91b7bebab9e8cc0ad6349b562c4', 150, 2, 2),
(97, 'Corn Plant', 'Annual', true, 'green, white, gold', 2, 3, 2, 'Dracaena fragrans ‘Massangeana’', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Dracaena_fragrans_a1.jpg/1200px-Dracaena_fragrans_a1.jpg', 150, 2, 2),
(98, 'Marginata', 'Perennial', true, 'gold, yellow, pink, white', 2, 3, 2, 'Dracaena marginata', 3, 'https://www.thespruce.com/thmb/C2reCth-GHN2CMo6T9x8QJ_5S24=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/grow-dracaena-marginata-indoors-1902749-2-983c52a2805144d899408949969a5728.jpg', 180, 2, 2),
(99, 'Gold Dust Dracaena', 'Perennial', false, 'green, cream, white', 2, 3, 2, 'Dracaena surculosa', 3, 'https://bs.plantnet.org/image/o/ac27436963ec82dd42a61446bbd68ef0430f94a0', 90, 2, 2),
(100, 'Miniature Agave', 'Perennial', false, 'green', 1, 4, 2, 'Dyckia brevifolia', 3, 'https://bs.plantnet.org/image/o/9b9b00ad80a3855674cc01fbed3656cecf3f0ae7', 30, 2, 2),
(101, 'Silver and Gold Dyckia', 'Perennial', true, 'green, gray', 1, 4, 2, 'Dyckia fosterana', 3, 'https://www.nurseriesonline.com/wp-content/uploads/2019/06/dyckia-fosteriana.jpg', 30, 2, 3),
(102, 'Molded Wax', 'Perennial', true, 'gray, green, pink, purple, white', 1, 4, 2, 'Echeveria agavoides', 3, 'https://bs.plantnet.org/image/o/945d29e948325743fb3b882c03552ffb4d06f047', 30, 1, 5),
(103, 'Mexican Snowball', 'Herbaceous Perennial', true, 'blue, gray, green', 1, 4, 2, 'Echeveria elegans', 3, 'https://bs.plantnet.org/image/o/d9546d60dbac2cc9756aebf4b105b9b17190342e', 10, 1, 5),
(104, 'Lace Cactus', 'Perennial', true, 'grey, white', 1, 4, 2, 'Echinocereus reichenbachii', 3, 'https://bs.plantnet.org/image/o/eb2657554f1ab998e71bfb7d3653c46559c6a6f3', 15, 1, 5),
(105, 'Spice Orchid', 'Perennial', true, 'green', 3, 3, 2, 'Epidendrum atropurpureum', 1, 'https://bs.plantnet.org/image/o/7f0cab2d8c15fe88a992301c423d5fe1babf9b0c', 45, 3, 4),
(106, 'Orchid Cacti', 'Perennial', true, 'green', 2, 3, 2, 'Epiphyllum hybrids', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Epiphyllum_Wendy-2.jpg/220px-Epiphyllum_Wendy-2.jpg', 60, 2, 1),
(107, 'Golden Pothos', 'Perennial', false, 'gold, green, white', 2, 3, 2, 'Epipremnum aureum', 4, 'https://bs.plantnet.org/image/o/5b26070f9c1e29609e0ff022a7411b9b02bb6c16', 180, 2, 2),
(108, 'Marble Queen', 'Perennial', false, 'green, white', 2, 3, 2, 'Epipremnum aureum ‘Marble Queen’', 4, 'https://aroidwiki.com/wp-content/uploads/2021/12/marble-queen-pothos-care-image11-1024x768.jpg', 180, 2, 2),
(109, 'Flame Violet', 'Herbaceous Perennial', true, 'green, orange, purple', 3, 3, 2, 'Episcia cupreata', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Episcia_cupreata_%289631125202%29.jpg/220px-Episcia_cupreata_%289631125202%29.jpg', 180, 3, 7),
(110, 'Lace-Flower Vine', 'Herbaceous Perennial', true, 'green', 3, 3, 2, 'Episcia dianthiflora', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Alsobia_dianthiflora_JuXQo02EHbSk.jpe', 20, 3, 7),
(111, 'Scarlet Violet', 'Herbaceous Perennial', true, 'dark green, red', 3, 3, 2, 'Episcia reptans', 2, 'https://bs.plantnet.org/image/o/d277d90ce007a9f7cf6a4cc508e27bf8d75a7767', 30, 3, 7),
(112, 'Blue Euphorbia', 'Perennial', false, 'green, grey', 2, 3, 2, 'Euphorbia coerulescens', 3, 'https://www.kakteen-matk-berlin.de/wp-content/uploads/2020/08/Euphorbia-coerulescens-gro%C3%9F.jpg', 30, 2, 5),
(113, 'Corncob Cactus', 'Perennial', false, 'green', 2, 4, 2, 'Euphorbia mammillaris', 3, 'https://bs.plantnet.org/image/o/9dc654a424102e263346d9ac0641165f8567e822', 30, 1, 5),
(114, 'Crown-of-Thorns', 'Woody Perennial', true, 'green, white', 2, 4, 2, 'Euphorbia milii splendens', 3, 'https://bs.plantnet.org/image/o/0335a2d232b6113c84aab00c08a94cdd53e66696', 130, 1, 5),
(115, 'Poinsettia', 'Woody Perennial', true, 'green', 2, 4, 2, 'Euphorbia pulcherrima', 3, 'https://bs.plantnet.org/image/o/5dfe234a63e7edce68fd9ef2fd5aea5b84b8b9f0', 90, 2, 1),
(116, 'Milkbush', 'Woody Perennial', false, 'green', 2, 4, 2, 'Euphorbia tirucalli', 3, 'https://www.thespruce.com/thmb/BIA1H2gauENyTZYXZIfDkkQjXaI=/4183x0/filters:no_upscale():max_bytes(150000):strip_icc()/grow-pencil-cactus-inside-1902984-01-29b9053bc85f402daa159079e90c0cfd.jpg', 200, 2, 1),
(117, 'Botanical Wonder Plant', 'Woody Perennial', false, 'green, white', 2, 3, 1, 'Fatshedera lizei', 4, 'https://photo.floraccess.com/43073q3h2gou0vua8mo7cb5g8c0pn8qvpu34hm2g_big.jpg', 90, 2, 2),
(118, 'Japanese Aralia', 'Woody Perennial', true, 'green', 2, 2, 1, 'Fatsia japonica', 4, 'https://bs.plantnet.org/image/o/4f0b509a4c0950aba5f831653c25a93d9220d570', 100, 2, 2),
(119, 'Weeping Fig', 'Woody Perennial', false, 'green, white', 2, 4, 2, 'Ficus benjamina', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Ficus_benjamina-Dars_TrTvy5yuuu8q.jpe', 150, 2, 2),
(120, 'Mistletoe Ficus', 'Woody Perennial', true, 'gold, green', 2, 3, 2, 'Ficus deltoidea', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Ficus_deltoidea_Mokk_I10d9m7muYF5.jpe', 70, 2, 2),
(121, 'Rubber Plant', 'Woody Perennial', false, 'green, light green', 2, 4, 2, 'Ficus elastica ‘Decora’', 3, 'https://s2.glbimg.com/hHIiAgiW7tNKT7CHWLfHIe4xPTI=/smart/e.glbimg.com/og/ed/f/original/2020/08/17/ficus_elastica_1.jpg', 90, 2, 2),
(122, 'Fiddle-Leaf Fig', 'Woody Perennial', false, 'green', 2, 4, 2, 'Ficus lyrata', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Ficus_lyrata_in_pots_NC_Cooperative_Extension_ccby2.0.jpg', 150, 2, 2),
(123, 'Dwarf Creeping Fig', 'Annual', false, 'green', 2, 3, 2, 'Ficus pumila ‘Minima’', 2, 'https://planthiza.com/wp-content/uploads/2020/07/rsz_ficus_pumila_white_sunny-zoom.jpg', 200, 2, 2),
(124, 'Cuban Laurel', 'Woody Perennial', false, 'green', 2, 3, 2, 'Ficus retusa', 3, 'https://s3g2u3k4.rocketcdn.me/wp-content/uploads/sites/4/2022/10/ficus-retusa.jpg', 40, 2, 2),
(125, 'Rooting Fig', 'Perennial', false, 'dark green', 2, 3, 2, 'Ficus sagittata', 3, 'https://plantsrescue.com/wp-content/uploads/2013/06/Ficus-sagittata.jpg', 120, 2, 2),
(127, 'Red-Nerved Fittonia', 'Herbaceous Perennial', false, 'green, pink, red, white, silver', 3, 3, 2, 'Fittonia verschaffeltii', 4, 'https://bs.plantnet.org/image/o/528a7a2faa13959559317fc9d36018091d6b79d2', 20, 3, 2),
(128, 'Silver-Nerved Fittonia', 'Herbaceous Perennial', false, 'silver green, green', 3, 3, 2, 'Fittonia verschaffeltii argyroneura', 4, 'https://www.gardentags.com/plant-encyclopedia/images/2943/fittonia-argyroneura-syn-fittonia-verschaffeltii.jpeg', 20, 3, 2),
(129, 'Fuchsias', 'Annual', true, 'green, red', 3, 3, 1, 'Fuchsia hybrida', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Fuchsia-X-Hybrid--Forest-and-Kim-Starr-CC-BY.jpg', 45, 3, 1),
(130, 'Ox Tongue', 'Perennial', false, 'green', 2, 3, 2, 'Gasteria hybrida', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Gasteria_obliqua_for_RWZl5mJ5qGtw.jpg', 20, 1, 5),
(131, 'Jewel Leaf Plant', 'Perennial', true, 'green, purple, pink, gray', 2, 3, 2, 'Graptopetalum amethystinum', 3, 'https://bs.plantnet.org/image/o/dc21d47c0ffa74fe9749e7d3716a2ccd46dbfdfe', 10, 1, 5),
(132, 'Scarlet Star', 'Perennial', true, 'green', 3, 3, 2, 'Guzmania lingulata ‘Major’', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Guzmania_Lingulatae_t51KZg65e8qJ.jpeg', 60, 2, 3),
(133, 'Striped Torch', 'Herbaceous Perennial', true, 'green', 3, 3, 2, 'Guzmania monostachia', 2, 'https://bs.plantnet.org/image/o/4fc7b15e3801aee164feb8973dc1767f8e463fc0', 45, 2, 3),
(134, 'Purple Passion', 'Perennial', false, 'green, purple', 2, 3, 2, 'Gynura aurantiaca ‘Purple Passion’', 4, 'https://bs.plantnet.org/image/o/1375ab3f303c3828c4477fb0fec80d9920ed2533', 60, 2, 2),
(135, 'Star Window Plant', 'Perennial', false, 'brown, green, orange, pink', 1, 4, 2, 'Haworthia cuspidata', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Haworthia_cooperi_Ab_Y651eyzvaWKd.jpeg', 20, 2, 5),
(136, 'Zebra Haworthia', 'Perennial', false, 'brown, green, orange, pink, white', 1, 4, 2, 'Haworthia fasciata', 3, 'https://bs.plantnet.org/image/o/1f2d844c43947dee5b95a9811ff3015985080302', 10, 2, 5),
(137, 'Little Zebra Plant', 'Perennial', false, 'brown, green, orange, pink', 1, 3, 2, 'Haworthia subfasciata', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Haworthia_fasciataS_d3ZUpmJdiw1i.jpg', 15, 2, 5),
(138, 'Clipped Window Plant', 'Perennial', false, 'green, white, red, brown', 1, 4, 2, 'Haworthia truncata', 3, 'https://bs.plantnet.org/image/o/f858f15355164cda694895690389d5faf33fabf8', 15, 1, 5),
(139, 'Algerian Ivy', 'Woody Perennial', false, 'green', 2, 3, 1, 'Hedera canariensis', 3, 'https://bs.plantnet.org/image/o/08a4378f07dba0b62d676afe7e13b9c5e1f25ce1', 900, 2, 1),
(140, 'English Ivy', 'Woody Perennial', false, 'green, white', 2, 3, 1, 'Hedera helix', 3, 'https://storage.googleapis.com/powop-assets/kew_profiles/Hedera-helix_fullsize.jpg', 700, 2, 1),
(141, 'Waffle Plant', 'Annual', false, 'green, purple, red', 2, 3, 2, 'Hemigraphis alternata', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Strobilanthes_altern_0N1u7ttfsdrU.jpeg', 25, 2, 2),
(142, 'Chinese Hibiscus', 'Woody Perennial', true, 'green', 2, 4, 2, 'Hibiscus rosa-sinensis', 3, 'https://bs.plantnet.org/image/o/a2b8cb049d071ed0bae3d324f7516b794399c4c8', 120, 2, 1),
(143, 'Amaryllis', 'Perennial', true, 'green', 2, 3, 2, 'Hippeastrum hybrids', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Hippeastrum_reginae__qLZ0hYReJyvK.jpeg', 90, 2, 1),
(146, 'Wax Plant', 'Woody Perennial', false, 'green, gray, white', 2, 3, 2, 'Hoya carnosa ‘Variegata’', 2, 'https://bs.plantnet.org/image/o/c14bffd43ffabe643de7945850378240b1282a43', 120, 2, 2),
(147, 'Sweetheart Hoya', 'Woody Perennial', false, 'green', 2, 3, 2, 'Hoya kerrii', 3, 'https://bs.plantnet.org/image/o/b0a93ed3d7f48f456e470b68cf3a3753cca7c702', 90, 2, 2),
(148, 'Hyacinth', 'Bulb Perennial', true, 'green', 2, 3, 1, 'Hyacinthus orientalis', 2, 'https://bs.plantnet.org/image/o/5854119576866163bdb4d5c86cc3e3caf89287a3', 30, 3, 1),
(149, 'Busy Lizzie Impatiens', 'Annual', true, 'green', 2, 3, 2, 'Impatiens wallerana ‘Variegata’', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Impatiens-walleriana--Forest-and-Kim-Starr--cc-by-2-0.jpg', 60, 2, 1),
(150, 'Ixora', 'Perennial', true, 'green', 2, 4, 2, 'Ixora coccinea', 3, 'https://bs.plantnet.org/image/o/e33a2cc8d00799917670159c01b2354ac1b89091', 120, 2, 1),
(151, 'Peregrian', 'Perennial', true, 'green', 2, 4, 2, 'Jatropha integerrima', 3, 'https://bs.plantnet.org/image/o/eecdc7d58fe5adb7b1c3c1f0cd9dbd307489b748', 300, 2, 1),
(152, 'Shrimp Plant', 'Perennial', true, 'green', 2, 4, 2, 'Justicia brandegeana', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Justicia_brandegeana_-_Botanischer_Garten_Freiburg_-_DSC06293.jpg/800px-Justicia_brandegeana_-_Botanischer_Garten_Freiburg_-_DSC06293.jpg', 90, 2, 1),
(153, 'Christmas Kalanchoe', 'Perennial', true, 'green', 2, 4, 2, 'Kalanchoe blossfeldiana', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kalanchoe_blossfeldiana_9819.JPG/390px-Kalanchoe_blossfeldiana_9819.JPG', 45, 2, 1),
(154, 'Dwarf Purple Kalanchoe', 'Perennial', true, 'white, green', 2, 4, 2, 'Kalanchoe pumila', 1, 'https://bs.plantnet.org/image/o/86161b5ad8b136bf2bc5e01534f1ff83eca470d7', 20, 1, 5),
(155, 'Panda Plant', 'Perennial', false, 'brown, green', 2, 4, 2, 'Kalanchoe tomentosa', 3, 'https://bs.plantnet.org/image/o/0f453e961461275b130c4f632708926f1cdd84f7', 30, 1, 5),
(156, 'Turk’s Cap', 'Perennial', true, 'green', 2, 4, 2, 'Malvaviscus arboreus', 2, 'https://bs.plantnet.org/image/o/e70d9a2e07b6f7371da9d294495aec9bfd145ce1', 60, 3, 1),
(157, 'Powder Puff', 'Perennial', true, 'green', 1, 4, 2, 'Mammillaria bocasana', 3, 'https://bs.plantnet.org/image/o/86ea885d6c3f9671e7f0fca154e2c37164bcb77f', 12, 1, 5),
(158, 'Firecracker Plant', 'Annual', true, 'green', 3, 3, 2, 'Manettia inflata', 3, 'https://images.immediate.co.uk/production/volatile/sites/10/2018/08/aae092e6-80ea-42ce-99d3-1566a436e4d6-7d250a7.jpg', 180, 2, 1),
(159, 'Red Nerve Plant', 'Perennial', false, 'dark green, red', 2, 3, 2, 'Maranta leuconeura erythroneura', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Maranta_leuconeura_var._erythroneura_f22.jpg/799px-Maranta_leuconeura_var._erythroneura_f22.jpg?20180802102917', 30, 2, 2),
(160, 'Prayer Plant', 'Perennial', false, 'green, dark green, purple, red', 2, 3, 2, 'Maranta leuconeura kerchoviana', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Maranta_leuconeura_-_Copenhagen_Botanical_Garden_-_DSC07996.JPG/800px-Maranta_leuconeura_-_Copenhagen_Botanical_Garden_-_DSC07996.JPG?20120624215434', 40, 2, 2),
(161, 'Plush Vine', 'Perennial', true, 'green', 2, 3, 2, 'Mikania ternata', 3, 'https://upload.wikimedia.org/wikipedia/commons/2/22/Mikania_natalensis_flowers_06_09_2011.jpg', 300, 2, 2),
(162, 'Philodendron Pertusum', 'Woody Perennial', false, 'green', 2, 3, 2, 'Monstera deliciosa', 2, 'https://bs.plantnet.org/image/o/a3a043c163463e4cf1941e473a134700ed327d84', 300, 2, 2),
(163, 'Window Leaf', 'Perennial', false, 'green', 2, 2, 2, 'Monstera obliqua', 3, 'https://bs.plantnet.org/image/o/0ced5365bd2a58d4b4ce2f66ae4d6d413756194e', 60, 2, 2),
(164, 'Black Alloplectus', 'Perennial', true, 'dark green, red', 2, 3, 2, 'Nautilocalyx lynchii', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Nautilocalyx_lynchii_-_Bergianska_tr%C3%A4dg%C3%A5rden_-_Stockholm%2C_Sweden_-_DSC00488.JPG/800px-Nautilocalyx_lynchii_-_Bergianska_tr%C3%A4dg%C3%A5rden_-_Stockholm%2C_Sweden_-_DSC00488.JPG', 30, 3, 7),
(165, 'Tricolor Bromeliad', 'Perennial', false, 'pink, red, white, green', 2, 3, 2, 'Neoregelia carolinae ‘Tricolor’', 3, 'https://bs.plantnet.org/image/o/4f3bbad82925bd71e87f8263a74bc82254732e91', 30, 2, 3),
(166, 'Zonata', 'Perennial', false, 'pink, red, white, green', 2, 3, 2, 'Neoregelia zonata', 3, 'https://bs.plantnet.org/image/o/4f3bbad82925bd71e87f8263a74bc82254732e91', 30, 2, 3),
(167, 'Boston Fern', 'Perennial', false, 'gold, green', 3, 3, 2, 'Nephrolepis exaltata ‘Bostoniensis’', 3, 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Boston_Fern_%28Nephrolepis_exaltata%29.jpg', 90, 2, 6),
(168, 'Fluffy Ruffles', 'Perennial', false, 'gold, green', 3, 3, 2, 'Nephrolepis exaltata ‘Fluffy Ruffles’', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Nephrolepis_exaltata_Fluffy_Ruffles_0zz.jpg/800px-Nephrolepis_exaltata_Fluffy_Ruffles_0zz.jpg?20170713180645', 30, 2, 6),
(169, 'Miniature Bird’s Nest', 'Perennial', false, 'green, white, red', 2, 3, 2, 'Nidularium innocentii nana', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Nidularium_innocentii_innocentii_BotGardBln310505.jpg/565px-Nidularium_innocentii_innocentii_BotGardBln310505.jpg', 20, 3, 3),
(170, 'Little Tree Cactus', 'Perennial', true, 'green, white', 1, 4, 2, 'Opuntia vilis', 3, 'https://images.cactuseros.com/220x220/Imagenes/CactusUsuarios/Emilio%20V/111788.jpg', 45, 1, 5),
(171, 'Irish Mittens', 'Perennial', true, 'green', 1, 4, 2, 'Opuntia vulgaris', 3, 'https://bs.plantnet.org/image/o/364d6d31ae4843926ea41034b006d9e013e20d15', 90, 1, 5),
(172, 'Finger Oxalis', 'Perennial', true, 'green', 2, 4, 2, 'Oxalis flava', 2, 'https://bs.plantnet.org/image/o/da8deaabaca462ad7ef55939676b69878945ebd7', 25, 2, 1),
(173, 'Red Oxalis', 'Perennial', true, 'green, red', 2, 4, 2, 'Oxalis rubra', 2, 'https://bs.plantnet.org/image/o/148053cf051e261c835e69db48b0d5d8526b8c89', 20, 2, 1),
(174, 'Pearly Moonstones', 'Perennial', true, 'blue, gray, green', 2, 4, 2, 'Pachyphytum oviferum', 3, 'https://bs.plantnet.org/image/o/43c6dc5b44f935bbf972a4d299c3be3f167bbb73', 15, 2, 5),
(175, 'Yellow Shrimp Plant', 'Perennial', true, 'dark green', 2, 3, 2, 'Pachystachys lutea', 3, 'https://bs.plantnet.org/image/o/dd8139a04b3fbc5ec11856809daf3da2c81a8c47', 80, 2, 1),
(179, 'Ivy Geranium', 'Annual', true, 'green, brown', 2, 4, 1, 'Pelargonium peltatum', 2, 'https://bs.plantnet.org/image/o/a9d0c637d50c0214b4d7c93b8886c207a1a31d2f', 90, 2, 1),
(180, 'Button Fern', 'Perennial', false, 'green', 2, 3, 2, 'Pellaea rotundifolia', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Pellaea_rotundifolia_-_Berlin_Botanical_Garden_-_IMG_8761.JPG/800px-Pellaea_rotundifolia_-_Berlin_Botanical_Garden_-_IMG_8761.JPG', 30, 3, 6),
(181, 'Satin Pellionia', 'Annual', false, 'green, white, dark green', 2, 3, 2, 'Pellionia pulchra', 3, 'https://iloveflores.com/wp-content/uploads/2022/10/decoracao-Pellionia-repens.jpg', 15, 3, 2),
(182, 'Egyptian Star Cluster', 'Perennial', true, 'green', 2, 4, 2, 'Pentas lanceolata', 4, 'https://bs.plantnet.org/image/o/db5444eedfa6c4401fd8af9c662b13ded72e05e5', 60, 2, 1),
(183, 'Emerald Ripple', 'Perennial', true, 'green, purple, red', 2, 3, 2, 'Peperomia caperata', 4, 'https://bs.plantnet.org/image/o/5e71d9bad1ab8b60c806794b649b9b1825480c4c', 20, 2, 2),
(184, 'Leather Peperomia', 'Perennial', false, 'green', 2, 3, 2, 'Peperomia crassifolia', 2, 'http://world-population.net/house_plants/script/images/186.jpg', 20, 2, 2),
(185, 'Baby Rubber Tree', 'Perennial', false, 'green, cream, red', 2, 3, 2, 'Peperomia obtusifolia', 2, 'https://bs.plantnet.org/image/o/21b7dab48594def004c2c7117fd614790ad196d6', 60, 2, 2),
(186, 'Fiddle-Leaf Philodendron', 'Perennial', false, 'green', 2, 2, 2, 'Philodendron bipennifolium', 2, 'https://bs.plantnet.org/image/o/970941aa447a165c700ce7c6927735be8488da33', 120, 2, 2),
(187, 'Emerald Queen', 'Perennial', false, 'green', 2, 3, 2, 'Philodendron ‘Emerald Queen’', 2, 'https://upload.wikimedia.org/wikipedia/commons/8/86/Philodendron_emerald_queen-leaf-yercaud-salem-India.JPG', 200, 2, 2),
(188, 'Florida', 'Perennial', false, 'green', 2, 3, 2, 'Philodendron ‘Florida’', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Philodendron_bipinnatifidum_%28Philodendron_selloum%29_-_Naples_Botanical_Garden_-_Naples%2C_Florida_-_DSC09593.jpg/800px-Philodendron_bipinnatifidum_%28Philodendron_selloum%29_-_Naples_Botanical_Garden_-_Naples%2C_Florida_-_DSC09593.jpg?20180208102102', 200, 2, 2),
(189, 'Heart-Leaf Philodendron', 'Perennial', false, 'dark green', 2, 3, 2, 'Philodendron scandens oxycardium', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Philodendron_scandens_subsp_oxycardium.JPG/800px-Philodendron_scandens_subsp_oxycardium.JPG?20080518172418', 90, 2, 2),
(190, 'Selloum', 'Woody Perennial', false, 'green', 2, 3, 2, 'Philodendron selloum', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Philodendron_bipinna_2iMvhW4Z4OMK.jpe', 160, 2, 2),
(192, 'Aluminum Plant', 'Perennial', true, 'gray, green', 3, 3, 2, 'Pilea cadierei', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Pilea_cadierei_Dader_N77MNbJ8llee.jpeg', 30, 3, 2),
(193, 'Artillery Plant', 'Annual', false, 'green', 3, 3, 2, 'Pilea microphylla', 2, 'https://bs.plantnet.org/image/o/26c1a7a88d4cd9c35e60747ca9d92170747136a7', 30, 3, 2),
(194, 'Staghorn Fern', 'Perennial', false, 'gray, green', 2, 3, 2, 'Platycerium bifurcatum', 2, 'https://bs.plantnet.org/image/o/fddabbe87026dc552345774fa5ebfa30fdd20adb', 90, 2, 6),
(195, 'Swedish Ivy', 'Perennial', true, 'green', 2, 3, 2, 'Plectranthus australis', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Plectranthus_parvifl_dmUtFWDfAWoU.jpg', 60, 2, 2),
(198, 'Variegated Balfour Aralia', 'Woody Perennial', false, 'green', 2, 3, 2, 'Polyscias balfouriana ‘Marginata’', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Polyscias_balfouriana_Dinesh_Vlake_ccbysa2.0_2.jpg', 180, 2, 2),
(199, 'Ming Aralia', 'Perennial', false, 'green', 2, 3, 2, 'Polyscias fruticosa', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Polyscias_fruticosa__Zuzq13pOIRy1.jpg', 180, 2, 2),
(200, 'Lady Palm', 'Perennial', false, 'green', 2, 3, 2, 'Rhapis excelsa', 2, 'https://bs.plantnet.org/image/o/a51ec15ca58036c4dc482de9efdee66a7d98fd1e', 180, 2, 2),
(201, 'Azaleas', 'Woody Perennial', true, 'green', 3, 3, 1, 'Rhododendron hybrids', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Rhododendron-Knaphill-Homebush--KingsbraeGardens-by-nc-nd-2-0.jpg', 120, 3, 2),
(202, 'Red-Spray Ruellia', 'Annual', true, 'green', 2, 4, 2, 'Ruellia elegans', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Ruellia-elegans--Scott-Zona--CC-BY-NC.jpg', 60, 2, 1),
(203, 'African Violets', 'Annual', true, 'green, pink, purple, red', 2, 3, 2, 'Streptocarpus ionanthus ', 2, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Streptocarpus_ionant_CQVShdxnzGdc.jpeg', 25, 3, 7),
(204, 'Parva Sansevieria', 'Perennial', true, 'dark green, green', 1, 3, 2, 'Sansevieria parva', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Sansevieria-parva.jpg/800px-Sansevieria-parva.jpg?20080413092736', 30, 2, 5),
(205, 'Birdsnest Sansevieria', 'Perennial', false, 'green, dark green, yellow', 1, 3, 2, 'Sansevieria trifasciata ‘Hahnii’', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/HK_Plant_Green_Leaves_2.JPG/1024px-HK_Plant_Green_Leaves_2.JPG', 20, 2, 5),
(206, 'Gold-Banded Sansevieria', 'Perennial', false, 'green, yellow', 1, 3, 2, 'Sansevieria trifasciata ‘Laurentii’', 2, 'https://upload.wikimedia.org/wikipedia/commons/4/45/Sansevieria_trifasciata_Laurentii_pm_4.jpg', 90, 2, 5),
(207, 'Strawberry Geranium', 'Herbaceous Perennial', true, 'gold, gray, green, pink, purple, white', 2, 3, 1, 'Saxifraga stolonifera', 1, 'https://bs.plantnet.org/image/o/43542c2cd1a0fd974698fac2546cb9c6a9c3f570', 45, 2, 2),
(208, 'Christmas Cactus', 'Perennial', false, 'green', 2, 3, 2, 'Schlumbergera bridgesii', 4, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Schlumbergera_buckle_Og5EpIKSOXPe.jpe', 60, 2, 2),
(209, 'Christmas Cactus', 'Herbaceous Perennial', true, 'green', 2, 3, 2, 'Schlumbergera truncata', 2, 'https://bs.plantnet.org/image/o/b2b25b8fb91f0b2308767cd033a3209468b21252', 30, 2, 2),
(210, 'Silver Pothos', 'Woody Perennial', false, 'gray, green', 2, 2, 2, 'Scindapsus pictus', 4, 'https://bs.plantnet.org/image/o/39f3a79f3496358538153d16880505cd63886650', 30, 2, 2),
(211, 'Showy Sedum', 'Perennial', true, 'blue, green', 2, 4, 1, 'Sedum spectabile', 4, 'https://bs.plantnet.org/image/o/b649fffd28d057200573eefeeafb01f9a82c9a8c', 60, 2, 5),
(212, 'Cow Web Houseleek', 'Succulent Perennial', true, 'green, purple, red', 2, 4, 1, 'Sempervivum arachniodeum', 3, 'https://bs.plantnet.org/image/o/47e2d06333cd2fa4a71dfc67ac1151c07e02c942', 10, 2, 5),
(213, 'Purple Heart', 'Annual', true, 'purple', 2, 4, 2, 'Setcreasea pallida ‘Purple Heart’', 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Tradescantia_pallida_C.jpg/636px-Tradescantia_pallida_C.jpg?20080131140118', 60, 2, 2),
(214, 'Gloxinia', 'Annual', true, 'green', 3, 3, 2, 'Sinningia speciosa', 2, 'https://bs.plantnet.org/image/o/58876c38583023a45cb37b3fb4d84c7e7057c25e', 30, 2, 7),
(215, 'Baby Tears', 'Perennial', true, 'gold, green', 3, 3, 2, 'Soleirolia soleirolii', 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Helxine_soleirolii_WPC.jpg/1024px-Helxine_soleirolii_WPC.jpg', 15, 3, 2),
(216, 'Peace Lily', 'Perennial', true, 'green', 2, 3, 2, 'Spathiphyllum ‘Clevelandii’', 2, 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Peace_Lily%2C_Spathiphyllum_Genus_%28modified%29.jpg', 60, 3, 2),
(218, 'Carrion Flower', 'Perennial', true, 'green', 2, 4, 2, 'Stapelia nobilis', 3, 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Strapelia_variegata.jpg', 20, 2, 5),
(219, 'Cape Primrose', 'Perennial', true, 'green', 2, 3, 2, 'Streptocarpus x hybridus', 3, 'https://upload.wikimedia.org/wikipedia/commons/e/ee/2007-03-20Streptocarpus03.jpg', 40, 2, 7),
(220, 'Persian Shield', 'Annual', true, 'gray, green, purple', 2, 3, 2, 'Strobilanthes dyeranum', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Persian_shield_%28Strobilanthes_dyeriana%29_Maligano_Buton_Island_2.jpg/1024px-Persian_shield_%28Strobilanthes_dyeriana%29_Maligano_Buton_Island_2.jpg', 120, 2, 2),
(221, 'Nephthytis', 'Annual', true, 'green', 2, 3, 2, 'Syngonium podophyllum', 3, 'https://bs.plantnet.org/image/o/38277650a403d7ec067ca385f714730676472edb', 150, 2, 2),
(222, 'Dancing Bulb', 'Perennial', true, 'green, red', 2, 3, 2, 'Tillandsia bulbosa', 4, 'https://bs.plantnet.org/image/o/7111e2bd71f03f125c118e644813146ce4c8e1b4', 30, 2, 3),
(223, 'Blue-Flowered Torch', 'Perennial', true, 'green', 2, 3, 2, 'Tillandsia lindenii', 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Tillandsia_lindenii_%2823019819879%29.jpg/1200px-Tillandsia_lindenii_%2823019819879%29.jpg', 20, 2, 3),
(224, 'Piggyback Plant', 'Perennial', true, 'green', 2, 3, 1, 'Tolmiea menziesii', 2, 'https://bs.plantnet.org/image/o/7f1d93b625bd753dc0088da19f88332be13d2dbf', '30', 2, 2),
(226, 'White Velvet', 'Herbaceous Perennial', true, 'gray, green, purple', 2, 3, 2, 'Tradescantia sillamontana', 3, 'https://bs.plantnet.org/image/o/d6edab75a4f53985b9e912b59cfc9780b31eaa4b', 45, 2, 2),
(227, 'Flaming Sword', 'Perennial', true, 'green', 2, 3, 2, 'Vriesea splendens', 3, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Vriesea-flower-HAns__vMVuTxTA24r2.jpeg', 80, 2, 3);

INSERT INTO public.division (id, luminosity, name, user_id)
VALUES (1, 2, 'Living Room', 2),
       (2, 3, 'Bedroom', 2),
       (3, 2, 'Living Room', 3),
       (4, 3, 'Bedroom', 3);

INSERT INTO public.division_sensor (id, name, sensor_code, division_id, user_id)
VALUES (1, 'Living Room Temperature Sensor', 'TMP123', 1, 2),
       (2, 'Living Room Humidity Sensor', 'HMD456', 1, 2),
       (3, 'Bedroom Temperature Sensor', 'TMP789', 2, 2),
       (4, 'Bedroom Humidity Sensor', 'HMD789', 2, 2);

INSERT INTO public.plant (id, name, plant_condition, photo, plantation_date, division_id, user_id, species_id)
VALUES (1, 'Anthony', 0, 'https://cdn.pixabay.com/photo/2018/03/06/19/33/vase-3204337_960_720.jpg', '2022-01-01', 1, 2, 1),
       (2, 'Orchid', 2, 'https://images.pexels.com/photos/7814295/pexels-photo-7814295.jpeg', '2022-03-15', 1, 2, 7),
       (3, 'Beth', 1, 'https://cdn.pixabay.com/photo/2021/05/16/01/04/orchids-6256963_960_720.jpg', '2022-04-20', 2, 2, 4),
       (4, 'Juliana the Cactus', 2, 'https://cdn.pixabay.com/photo/2016/11/21/16/05/cacti-1846147_960_720.jpg', '2022-02-10', 2, 2, 5),
       (5, 'Anthony', 0, 'https://cdn.pixabay.com/photo/2018/03/06/19/33/vase-3204337_960_720.jpg', '2022-01-01', 3, 3, 1),
       (6, 'Orchid', 2, 'https://images.pexels.com/photos/7814295/pexels-photo-7814295.jpeg', '2022-03-15', 3, 3, 7),
       (7, 'Beth', 1, 'https://cdn.pixabay.com/photo/2021/05/16/01/04/orchids-6256963_960_720.jpg', '2022-04-20', 4, 3, 4),
       (8, 'Juliana the Cactus', 2, 'https://cdn.pixabay.com/photo/2016/11/21/16/05/cacti-1846147_960_720.jpg', '2022-02-10', 4, 3, 5);

INSERT INTO public.plant_sensor (id, name, sensor_code, user_id, plant_id)
VALUES (1, 'Anthony Sensor', 'ANT123', 2, 1),
       (2, 'Orchid Sensor', 'WEN123', 2, 2),
       (3, 'Beth Sensor', 'BTH123', 2, 3),
       (4, 'Juliana Sensor', 'JUL123', 2, 4);
       
INSERT INTO public.tasks_current VALUES (1, 'Water Anthony',
                         CURRENT_DATE, 0, 1),
                        (2, 'Change Orchid soil mix',
                         '2023-06-13', 1, 2),
                        (4, 'Check Juliana''s condition ',
                         '2023-06-15', 3, 4),
                        (5, 'Fertilize Anthony',
                         CURRENT_DATE, 4, 1),
                         (6, 'Change Anthony soil mix',
                         CURRENT_DATE, 1, 1),
                         (7, 'Check Anthony''s condition ',
                         CURRENT_DATE, 3, 4),
                         (8, 'Water Orchid',
                         '2023-06-22', 0, 2),
                         (9, 'Water Beth',
                         '2023-06-13', 0, 3),
                         (10, 'Water Juliana',
                         '2023-06-15', 0, 4),
                         (11, 'Water Anthony',
                         CURRENT_DATE, 0, 5),
                        (12, 'Change Orchid soil mix',
                         '2023-06-13', 1, 6),
                        (13, 'Check Juliana''s condition ',
                         '2023-06-15', 3, 8),
                        (14, 'Fertilize Anthony',
                         CURRENT_DATE, 4, 5),
                         (15, 'Change Anthony soil mix',
                         CURRENT_DATE, 1, 5),
                         (16, 'Check Anthony''s condition ',
                         CURRENT_DATE, 3, 5),
                         (17, 'Water Orchid',
                         '2023-06-22', 0, 6),
                         (18, 'Water Beth',
                         '2023-06-13', 0, 7),
                         (19, 'Water Juliana',
                         '2023-06-15', 0, 8);
                         
INSERT INTO public.task_settings VALUES (1, TRUE, 7, 0, 1),
                        (2, TRUE,450, 1, 1),
                        (3, TRUE,7, 3, 1),
                        (4, TRUE,30, 4, 1),
                        (5, TRUE,4, 0, 2),
                        (6, TRUE,450, 1, 2),
                        (7, TRUE,5, 3, 2),
                        (8, TRUE,30, 4, 2),
                        (9, TRUE,7, 0, 3),
                        (10, TRUE,450, 1, 3),
                        (11, TRUE,7, 3, 3),
                        (12, TRUE,30, 4, 3),
                        (13, TRUE,10, 0, 4),
                        (14, TRUE,450, 1, 4),
                        (15, TRUE,10, 3, 4),
                        (16, TRUE,60, 4, 4),
                        (17, TRUE, 7, 0, 5),
                        (18, TRUE,450, 1, 5),
                        (19, TRUE,7, 3, 5),
                        (20, TRUE,30, 4, 5),
                        (21, TRUE,4, 0, 6),
                        (22, TRUE,450, 1, 6),
                        (23, TRUE,5, 3, 6),
                        (24, TRUE,30, 4, 6),
                        (25, TRUE,7, 0, 7),
                        (26, TRUE,450, 1, 7),
                        (27, TRUE,7, 3, 7),
                        (28, TRUE,30, 4, 7),
                        (29, TRUE,10, 0, 8),
                        (30, TRUE,450, 1, 8),
                        (31, TRUE,10, 3, 8),
                        (32, TRUE,60, 4, 8);
     
INSERT INTO public.tasks_history VALUES (1, '2023-05-10', 'Water Anthony', 0, 1),
                        (2,'2023-05-13', 'Change Orchid soil mix', 1, 2),
                        (4,'2023-05-15','Check Juliana''s condition ', 3, 4),
                        (5,'2023-05-18', 'Fertilize Anthony', 4, 1),
                        (6, '2023-05-18', 'Change Anthony soil mix', 1, 1),
                        (7, '2023-05-18','Check Anthony''s condition ', 3, 1),
                        (8,'2023-05-22', 'Water Orchid', 0, 2),
                        (9, '2023-05-13', 'Water Beth', 0, 3),
                        (10,'2023-05-15', 'Water Juliana', 0, 4),
                        (11, '2023-05-10', 'Water Anthony', 0, 5),
                        (12,'2023-05-13', 'Change Orchid soil mix', 1, 6),
                        (13,'2023-05-15','Check Juliana''s condition ', 3, 8),
                        (14,'2023-05-18', 'Fertilize Anthony', 4, 5),
                        (15, '2023-05-18', 'Change Anthony soil mix', 1, 5),
                        (16, '2023-05-18','Check Anthony''s condition ', 3, 5),
                        (17,'2023-05-22', 'Water Orchid', 0, 6),
                        (18, '2023-05-13', 'Water Beth', 0, 7),
                        (19,'2023-05-15', 'Water Juliana', 0, 8); ;                    
                         
                                    
  
-- SETTING ID's               
                 

SELECT pg_catalog.setval('public.air_quality_measurement_seq', (SELECT MAX(id) FROM public.air_quality_measurement WHERE id > 0));


--
-- Name: air_temperature_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.air_temperature_measurement_seq', (SELECT MAX(id) FROM public.air_temperature_measurement WHERE id > 0));


--
-- Name: comment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_seq', (SELECT MAX(id) FROM public.comments WHERE id > 0));


--
-- Name: disease_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disease_seq', (SELECT MAX(id) FROM public.disease WHERE id > 0));


--
-- Name: division_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_sensor_seq', (SELECT MAX(id) FROM public.division_sensor WHERE id > 0));


--
-- Name: division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_seq', (SELECT MAX(id) FROM public.division WHERE id > 0));


--
-- Name: journal_entry_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_entry_seq', (SELECT MAX(id) FROM public.journal_entry WHERE id > 0));


--
-- Name: plant_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_sensor_seq', (SELECT MAX(id) FROM public.plant_sensor WHERE id > 0));


--
-- Name: plant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_seq', (SELECT MAX(id) FROM public.plant WHERE id > 0));


--
-- Name: plant_species_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_species_seq', (SELECT MAX(id) FROM public.plant_species WHERE id > 0));


--
-- Name: soil_quality_measurement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.soil_quality_measurement_seq', (SELECT MAX(id) FROM public.soil_quality_measurement WHERE id > 0));


--
-- Name: species_family_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_family_seq', (SELECT MAX(id) FROM public.species_family WHERE id > 0));


--
-- Name: task_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_current_seq', (SELECT MAX(id) FROM public.tasks_current WHERE id > 0));

SELECT pg_catalog.setval('public.task_settings_seq', (SELECT MAX(id) FROM public.task_settings WHERE id > 0));

SELECT pg_catalog.setval('public.tasks_history_seq', (SELECT MAX(id) FROM public.tasks_history WHERE id > 0));

--
-- Name: utilizador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizador_seq', (SELECT MAX(id) FROM public.utilizador WHERE id > 0));


--
-- Name: air_quality_measurement air_quality_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
