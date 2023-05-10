.PHONY: code

CC = latexmk
CODE_DIR = code
RESUME_DIR = code/resume
CV_DIR = code/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

export max-print-line=2147483647

code: $(foreach x, cv resume, $x.pdf)

resume.pdf: $(CODE_DIR)/resume.tex $(RESUME_SRCS)
	 $(CC) -pdflua -lualatex="lualatex --shell-escape -file-line-error" -output-directory=$(CODE_DIR) $<

cv.pdf: $(CODE_DIR)/cv.tex $(CV_SRCS)
	 $(CC) -pdflua -lualatex="lualatex --shell-escape -file-line-error" -output-directory=$(CODE_DIR) $<

clean:
	rm -rf $(CODE_DIR)/*.pdf
