all: compile link

run: compile link
	./app $(ARGS)

compile:
ifndef PUBLISH
	g++ -c src/*.cpp -Iinclude
else
# Static:
	g++ -c src/*.cpp -Iinclude -DSFML_STATIC
endif

link:
# -mwindows to hide console
ifndef PUBLISH
	g++ *.o -o app -L lib -lsfml-graphics -lsfml-window -lsfml-system
else
# Static:
	g++ *.o -o app -L lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lgdi32 -lwinmm -mwindows -static
endif

ifeq ($(OS),Windows_NT)
clean:
	del *.o
	del app.exe
else
clean:
	rm *.o
	rm app
endif