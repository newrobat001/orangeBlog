package com.orangeBlog.service.serviceImpl;

import com.orangeBlog.dto.CommentDTO;
import com.orangeBlog.entity.Comment;
import com.orangeBlog.mapper.CommentMapper;
import com.orangeBlog.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
    @Autowired
    private CommentMapper comService;

    @Autowired
    private UserInfoServiceImpl userinfoSer;

    @Override
    public List<CommentDTO> getDirect(Long articleId) {
        return comService.getDirect(articleId);
    }

    @Override
    public List<CommentDTO> getChild(Long articleId) {
        return comService.getChild(articleId);
    }

    @Override
    public List<CommentDTO> getTh(Long ChildIdcleId) {
        return comService.getTh(ChildIdcleId);
    }

    @Override
    public Integer getAllCount(Long getDirectId) {
        return comService.getAllCount(getDirectId);
    }

    public List<CommentDTO> getCommentlist(Long id) {

        //三级评论
        List<CommentDTO> direct =  comService.getDirect(id);

        for (CommentDTO ment : direct) {
            System.out.println("一级评论: "+ment.getContent());
            String username = userinfoSer.getUsername(ment.getUserId());
            ment.setUserName(username);
            ment.setChild( comService.getChild(ment.getId()) );


            for (CommentDTO co : ment.getChild()) {
                String parentName = userinfoSer.getUsername(co.getUserId());
                co.setUserName( parentName );

                ment.setTh( comService.getTh(co.getId()) );
                System.out.println("二级评论: "+co.getContent());

                    for (CommentDTO coent : ment.getTh()) {
                    coent.setUserName(userinfoSer.getUsername(coent.getUserId()));
                    coent.setParentName(parentName);
                    System.out.println("三级级评论: "+co.getContent()+",父评论名："+parentName);
                }
            }
        }

        return direct;
    }



}
