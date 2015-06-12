vpath %.cpp Furnace
SOURCES=Furnace.cpp CEntity.cpp \
		CEvent.cpp CSurface.cpp \
		CAnimation.cpp CTile.cpp \
		CMap.cpp CArea.cpp \
		CCamera.cpp
OBJECTS=$(patsubst %.cpp, Furnace/obj/%.o, $(SOURCES))
CPPFLAGS=-Wall -g `sdl-config --cflags` -Wno-write-strings
LDFLAGS=`sdl-config --libs` -lSDL -lSDL_image

All: Furnace.bin

Furnace.bin: $(OBJECTS) 
	$(CXX) -o $@ $(OBJECTS) $(LDFLAGS) $(CPPFLAGS) 

$(OBJECTS): | Furnace/obj

Furnace/obj:
	@mkdir -p $@

Furnace/obj/%.o: %.cpp
	$(CXX) $(LDFLAGS) $(CPPFLAGS) -c $< -o $@ 


# cleanup
clean:
	rm -rf $(OBJECTS)
	rm -rf Furnace.bin
	rmdir Furnace/obj

# EOF
