#=======================================================================================
# Project folders
#=======================================================================================

#Main folders
SRCFOLDER := source/
INCFOLDER := include/
BINFOLDER := bin/
OBJFOLDER := obj/
TESTFOLDER := test/
OTHERFOLDER := other/

#Sub directory src
OSMFOLDER  := $(SRCFOLDER)osm/element/

#Sub directory inc
OSMINCFOLDER  := $(INCFOLDER)osm/element/

#Sub directory bin
TESTBINFOLDER := $(BINFOLDER)test/
APPBINFOLDER :=  $(BINFOLDER)app/
#======================================================================================
# Project flags
#======================================================================================
GPP = g++ $(ALLWARNINGS)
ALLWARNINGS := -Wall -Wextra -pedantic -Wshadow -Wredundant-decls -Woverloaded-virtual -Wsynth
IFLAG = -I./$(OSMINCFOLDER) 
# GOOGLETESTFLAG = -lgtest -lgtest_main

#======================================================================================
# Project Strings
#======================================================================================
TESTSEPARATOR = "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
CLEANSEPARATOR = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
#======================================================================================
# Project files
#======================================================================================
OSMCPPFILES = $(wildcard source/osm/element/*cpp)

all: prepare m2r

m2r: osmObjects
	$(GPP) obj/*.o source/main.cpp -o bin/app/$@ $(IFLAG)

#=====================================================================================
# Preparing object files
#=====================================================================================
# OSM
osmObjects: $(OSMCPPFILES:source/osm/element/%.cpp=obj/%.o)

obj/%.o: source/osm/element/%.cpp
	$(GPP) -c $< -o $@ $(IFLAG)

#======================================================================================
# Testing
# About: The command test compile all tests and put it in the folder bin/test.
# 	You should have a file in the src folder mapped into test. To make it 
#		organized, you should keep the same folder structure in test folder.
# Example:
#		make test  -> Compile all the tests
#		make testModel -> Compile all the tests in model folder.
#======================================================================================
#test: testModel testView testController testUtil testDao
#
## Test Model
#testModel: $(MODELTESTCPPFILES:test/model/%Test.cpp=bin/test/%)
#
#bin/test/%: test/model/%Test.cpp src/model/%.cpp
#	$(GPP) $^ -o $@ $(IFLAG) $(GOOGLETESTFLAG)
#
#bin/test/%: $(TESTFOLDER)dao/%Test.cpp src/dao/*.cpp
#	@echo $(TESTSEPARATOR)
#	@echo "++++++++ GOOGLE TEST: "  $@
#	@echo $(TESTSEPARATOR)
#	$(GPP) $^ -o $@ $(IFLAG) $(GOOGLETESTFLAG)
#
#=====================================================================================
# Project Actions
#=====================================================================================
PHONY: clean prepare doxy runTest

doxy:
	doxygen Doxyfile 

run:
	$(APPBINFOLDER)m2r

runTest:
	$(TESTBINFOLDER)Filter

prepare:
#	mkdir -p $(TESTFOLDER)controller
#	mkdir -p $(TESTFOLDER)model
#	mkdir -p $(TESTFOLDER)util
#	mkdir -p $(TESTFOLDER)view
#	mkdir -p $(TESTFOLDER)dao
	mkdir -p $(BINFOLDER)test
	mkdir -p $(BINFOLDER)app

clean:
	@echo $(CLEANSEPARATOR)
	rm -f $(OBJFOLDER)*
	rm -fr $(TESTBINFOLDER)*
	rm -fr $(APPBINFOLDER)*
	#rm -fr $(OTHERFOLDER)Doxy/*

