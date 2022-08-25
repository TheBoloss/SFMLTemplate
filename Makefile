all: compile link

run: compile link
	./app $(ARGS)

compile:
# g++ -c src/*.cpp -Iinclude
# Static:
	g++ -c src/*.cpp -Iinclude -DSFML_STATIC

link:
# -mwindows to hide console
# g++ *.o -o app -L lib -lsfml-graphics -lsfml-window -lsfml-system -mwindows
# Static:
	g++ *.o -o app -L lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lgdi32 -lwinmm -mwindows

ifeq ($(OS),Windows_NT)
clean:
	del *.o
	del app.exe
else
clean:
	rm *.o
	rm app
endif