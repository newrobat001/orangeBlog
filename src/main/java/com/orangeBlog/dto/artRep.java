package com.orangeBlog.dto;

import lombok.Data;

/**
 * (new Object[]{title,isPublish, creationType, categoryId, tagId, description, content} )
 */
@Data
public class artRep {
    private Boolean isPublish;
    private String title;
    private String description;
    private String content;
    private Long creationType;
    private Long categoryId;
    private Long tagId;


}
