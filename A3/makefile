FLAGS = -free -Wall

all: conv

conv: conv.cob romanA3_1.cob
	cobc -x $(FLAGS) romanA3_1.cob
	cobc -m $(FLAGS) conv.cob

clean:
	rm conv.so romanA3_1
