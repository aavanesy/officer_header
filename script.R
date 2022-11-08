
library(officer)
library(magrittr)

my_doc <- read_docx('empty_with_footnotes.docx') 

font.size_space = 4

my_doc <- my_doc %>%
  body_add_fpar(fpar(ftext(
    paste0("\u00A0"),
    fp_text(font.family = 'Calibri',
            font.size = font.size_space - 1, bold = TRUE)),
    fp_p = fp_par(text.align = "right",
                  shading.color = 'orange')), pos = 'on')

my_doc <- my_doc %>%
  body_add_fpar(fpar('Some Text',
                     fp_p = fp_par(text.align = "right",
                                   shading.color = 'orange')))

my_doc <- my_doc %>%
  body_add_fpar(fpar(ftext(
    paste0("\u00A0"),
    fp_text(font.family = 'Calibri',
            font.size = font.size_space, bold = TRUE)),
    fp_p = fp_par(text.align = "right",
                  shading.color = 'orange')))

my_doc <- my_doc %>%
  body_add_fpar(fpar(ftext(
    paste0("\u00A0"),
    fp_text(font.family = 'Calibri',
            font.size = font.size_space, bold = TRUE)),
    fp_p = fp_par(text.align = "right")))

print(my_doc, target = 'file.docx')

end_header <- block_section(
  prop_section(
    page_size =
      page_size(orient = "portrait"),
    type = "continuous",
    page_margins = page_mar(
      bottom = 0,
      top = 0.0,
      right = 0.05,
      left = 0.04,
      header = 0,
      footer = 0,
      gutter = 0
    )
  )
)

my_doc <- my_doc %>%
  body_end_block_section(end_header)


my_doc <- my_doc %>%
  body_add_fpar(fpar(
    #bold part
    ftext(paste0('Next Page'),
          fp_text(underlined = F, font.size = 9, font.family = "Calibri", italic = F, bold = TRUE)),
    
    fp_p = fp_par(text.align = "justify")), style=NULL)

print(my_doc, target = 'file2.docx')

