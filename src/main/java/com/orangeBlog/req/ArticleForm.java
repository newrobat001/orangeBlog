package com.orangeBlog.req;

import lombok.Data;

import java.util.List;

@Data
public class ArticleForm {
    private Long UserId;
    private String title;
    private Integer creationType;
    private Long categoryId;
    private List<Long> tagId;
    private String description;
    private String content;
    private boolean isPublish;
    private String Picture;
    private String SourceUrl;

}
