.PHONY: code

CC = latexmk
CODE_DIR = code
RESUME_DIR = code/resume
CV_DIR = code/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

code: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(CODE_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -lualatex -output-directory=$(CODE_DIR) $<

cv.pdf: $(CODE_DIR)/cv.tex $(CV_SRCS)
	$(CC) -lualatex -output-directory=$(CODE_DIR) $<

coverletter.pdf: $(CODE_DIR)/coverletter.tex
	$(CC) -lualatex -output-directory=$(CODE_DIR) $<

clean:
	rm -rf $(CODE_DIR)/*.pdf
