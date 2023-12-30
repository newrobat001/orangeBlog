package com.orangeBlog.mapper;

import com.orangeBlog.dto.CommentDTO;
import com.orangeBlog.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 评论表 Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface CommentMapper extends BaseMapper<Comment> {
    List<CommentDTO> getDirect(Long articleId);
    List<CommentDTO> getChild(Long getDirectId);

    List<CommentDTO> getTh(Long getChildId);

    @Select("SELECT COUNT(*) AS comment_count\n" +
            "FROM comment\n" +
            "WHERE article_id = #{getDirectId};\n")
    Integer getAllCount(Long getDirectId);
}
