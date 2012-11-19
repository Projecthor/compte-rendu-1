NAME=tpe
DEST=pdf

ifeq ($(DEST),dvi)
	VIEWER=xdvi
else
	VIEWER=evince
endif

all : $(NAME).$(DEST)

$(NAME).dvi : $(NAME).tex
	latex $<

$(NAME).ps : $(NAME).dvi
	dvips $<

$(NAME).pdf : $(NAME).tex
	pdflatex $<

view : $(NAME).$(DEST)
	$(VIEWER) $< > /dev/null 2>&1

clean :
	@touch $(NAME).$(DEST)
	@rm -v $(NAME).$(DEST)

rec : clean all

.PHONY: rec clean all


