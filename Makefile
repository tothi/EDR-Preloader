CXX := x86_64-w64-mingw32-g++
CXXFLAGS := -O0
AS := x86_64-w64-mingw32-as
LDFLAGS := -s

SRCDIR := includes
OBJDIR := obj
SRCS := $(wildcard $(SRCDIR)/*.cpp)
OBJS := $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

TARGET := preloader.exe

all: $(TARGET)

$(TARGET): $(OBJS) $(OBJDIR)/Main.o $(OBJDIR)/KiUserApcDispatcher.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR)/Main.o: Main.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -fpermissive -c $< -o $@

$(OBJDIR)/KiUserApcDispatcher.o: KiUserApcDispatcher.s | $(OBJDIR)
	$(AS) $(CXXFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -fr $(OBJDIR) $(TARGET)

.PHONY: all clean
