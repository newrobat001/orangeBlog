package com.orangeBlog.Util;

import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Document;


public class MarkdownToHtmlConverter {
    public static String convertMarkdownToHtml(String markdown) {
            Parser parser = Parser.builder().build();
            Document document = parser.parse(markdown);
            HtmlRenderer renderer = HtmlRenderer.builder().build();
            return renderer.render(document);
    }

}
