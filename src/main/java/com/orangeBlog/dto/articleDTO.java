package com.orangeBlog.dto;

import com.orangeBlog.entity.Article;
import com.orangeBlog.entity.ArticleDetail;
import com.orangeBlog.entity.Category;
import com.orangeBlog.entity.Tag;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 文章+内容
 * 完整信息
 */
@Data
public class articleDTO implements Serializable {

        private Article articleList;

        /**
         * 作者
         */
        private String author;

        /**
         * 类型
         * Category nameById = categoryService.getNameById(article.getCategoryId()
         */
        private String categoryName;

        /**
         * //标签
         *  List<Tag> tagsByArticleId = tagService.getTagsByArticleId(id);
         */
        private List<Tag> tags;

        /**
         * //评论
         *  * //        List< List<Comment> > commentList = comService.getCommentlist(id);
         *  *         List<CommentDTO> commentList = comService.getCommentlist(id);
         */
        private  List<CommentDTO> commentList;

        /**
         *  //统计文章评论数
         *  Integer allCount = comService.getAllCount(id);
         */
        private Integer commentCount;

        /**
         * //文章内容，md转换为html
         * String content = MarkdownToHtmlConverter.convertMarkdownToHtml(detail.getContent());
         */
        private String content;

        /**
         * //点赞信息
         *  *         Integer likeCount = likeService.countArticle(id);
         */
        private Integer likeCount;

        /**
         * //作者信息
         *  *         String username = userInfoService.getUsername(article.getUserId());
         */
        private String username;

        private Long userId;

        public articleDTO() {
        }


}
