
BUILD_DIR=build

SYSC_PATH=$(HOME)/personal/systemc-2.3.3
SYSC_INC=$(SYSC_PATH)/include
SYSC_LIB=$(SYSC_PATH)/lib-linux64

CXXFLAGS=-I$(SYSC_INC)
LDFLAGS=-L$(SYSC_LIB) -lsystemc

PROG=i2c

SOURCES=main.cpp controller.cpp
OBJS=$(addprefix $(BUILD_DIR)/, $(patsubst %.cpp,%.o,$(SOURCES)))

all : $(BUILD_DIR) $(PROG)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PROG) : $(OBJS)
	$(CXX) $(LDFLAGS) $^ -o $@

$(BUILD_DIR)/%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJS)
	rm -rf $(BUILD_DIR)
	rm -rf $(PROG)

run: $(PROG)
	LD_LIBRARY_PATH=$(SYSC_LIB) ./$(PROG)

.PHONY: all clean $(BUILD_DIR) run

