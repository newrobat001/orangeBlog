package com.orangeBlog.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.orangeBlog.Util.MarkdownToHtmlConverter;
import com.orangeBlog.dto.CommentDTO;
import com.orangeBlog.dto.articleDTO;
import com.orangeBlog.entity.*;
import com.orangeBlog.mapper.ArticleMapper;
import com.orangeBlog.req.ArticleForm;
import com.orangeBlog.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
@Slf4j
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
    @Autowired
    private ArticleDetailServiceImpl articleDetail;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private UserInfoServiceImpl userInfoService;
    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private TagServiceImpl tagService;
    @Autowired
    private ArticleTagServiceImpl articleTagService;

    @Autowired
    private CommentServiceImpl comService;

    @Autowired
    private LikeServiceImpl likeService;

    @Autowired
    private CommentServiceImpl commentService;
    /**
     * 首页轮播的文章推荐
     * @return
     */
    public List<articleDTO> getAllArticle(){

        List<Article> list = this.list();

        List<articleDTO> listDto= new ArrayList<articleDTO>();
        int i=0;
        for (Article art : list) {

            articleDTO dto=new articleDTO();
            dto.setArticleList(art);

            //获取类目名称
            Long categoryId = art.getCategoryId();
            String categoryName = categoryService.getCateName(categoryId);

            //获取作者名
            String byId1 = userInfoService.getUsername(art.getUserId());

            dto.setAuthor(byId1);
            dto.setCategoryName(categoryName);

            listDto.add(dto);
            i++;
            System.out.println("放入第"+i+"条数据;"+dto.toString());

        }

        return listDto;
    }

    /**
     * 获取不同分区的文章信息
     * @param
     * @return
     */
    @Override
    public List<articleDTO> getRecWithType(int type) {
        System.out.println(articleMapper);

        List<Article> list = articleMapper.getRecWithType(type);
        List<articleDTO> listDto= new ArrayList<articleDTO>();
        int i=0;
        for (Article art : list) {

            articleDTO dto=new articleDTO();
            dto.setArticleList(art);

            //获取类目名称
            Long categoryId = art.getCategoryId();
            String categoryName = categoryService.getCateName(categoryId);

            //获取作者名
            String byId1 = userInfoService.getUsername(art.getUserId());

            dto.setAuthor(byId1);
            dto.setCategoryName(categoryName);

            listDto.add(dto);
            i++;
            System.out.println("放入第"+i+"条数据;"+dto.toString());

        }

        return listDto;
    }

    @Override
    public List<articleDTO> getall() {
        List<Article> all = articleMapper.getAll();

        List<articleDTO> listDto= new ArrayList<articleDTO>();
        int i=0;
        for (Article art : all) {

            articleDTO dto=new articleDTO();
            dto.setArticleList(art);

            //获取类目名称
            Long categoryId = art.getCategoryId();
            String categoryName = categoryService.getCateName(categoryId);

            //获取作者名
            String byId1 = userInfoService.getUsername(art.getUserId());

            dto.setAuthor(byId1);
            dto.setCategoryName(categoryName);

            listDto.add(dto);
            i++;
            System.out.println("放入第"+i+"条数据;"+dto.toString());

        }
        return listDto;
    }

    @Override
    public List<Article> getlistById(Long id) {
        return articleMapper.getlistById(id);
    }

    /**
     * 保存新博客
     * @param form
     */
    @Override
    public void saveArticle(ArticleForm form) {
        //手动生成的文章id
        long id = IdWorker.getId()/2000000000;

        //新增文章表
        Article NewArticle = new Article();
        NewArticle
                .setId(id)
                .setUserId(form.getUserId())
                .setTitle(form.getTitle())
                .setShortTitle(form.getDescription())
                .setPicture(form.getPicture())
                .setCategoryId(form.getCategoryId())
                .setSource(form.getCreationType())
                .setSourceUrl(form.getSourceUrl())
                .setStatus(form.isPublish()?1:0);
        ArticleDetail NewDetail=new ArticleDetail();
        boolean save = this.save(NewArticle);

        //新增文章标签

        List<Long> tagId = form.getTagId();
        for (Long ids :
                tagId) {
            ArticleTag articleTag=new ArticleTag();
            articleTag.setArticleId(id);
            articleTag.setTagId(ids);
            boolean save1 = articleTagService.save(articleTag);
            System.out.println("这是保存的标签主键"+form.getTagId()+"保存结果："+save1);
        }

        //新增对应内容记录
        NewDetail.setContent(form.getContent())
                .setArticleId(id);
        articleDetail.save(NewDetail);
    }

    @Override
    public IPage<Article> getArticlePage(Page<Article> page) {
        return articleMapper.selectPage(page, new LambdaQueryWrapper<>());
    }

    /**
     * 分页
     * @param page
     * @return
     */
    @Override
    public IPage<Article> getArticlePage(Page<Article> page, LambdaQueryWrapper<Article> qw) {

        return articleMapper.selectPage(page, qw);
    }

    /**
     * 获取最近发布的文章
     * @return
     */
    @Override
    public List<articleDTO> getRecently() {

        List<Article> recently = articleMapper.getRecently();
        List<articleDTO> listDto= new ArrayList<articleDTO>();
        int i=0;
        for (Article art : recently) {

            articleDTO dto=new articleDTO();
            dto.setArticleList(art);

            //获取类目名称
            Long categoryId = art.getCategoryId();
            String categoryName = categoryService.getCateName(categoryId);

            //获取作者名
            String byId1 = userInfoService.getUsername(art.getUserId());

            dto.setAuthor(byId1);
            dto.setCategoryName(categoryName);

            listDto.add(dto);
            i++;
            System.out.println("放入第"+i+"条数据;"+dto.toString());

        }

        return listDto;
    }

    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    public articleDTO getAllinfo(Model model, Long id) {

        articleDTO articleDTO=new articleDTO();
        LambdaQueryWrapper<Article> artqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<ArticleDetail> deqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<Category> cateqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<ArticleTag> artTagqw = new LambdaQueryWrapper<>();

        //根据id查找文章信息
        artqw.eq(Article::getId, id);
        deqw.eq(ArticleDetail::getArticleId, id)
                .eq(ArticleDetail::getDeleted, 0);//限定未删除的

        //文章内容和信息
        Article article = this.getOne(artqw);

        ArticleDetail detail = articleDetail.getOne(deqw);

        //类型
        Category nameById = categoryService.getNameById(article.getCategoryId());

        //标签
        List<Tag> tagsByArticleId = tagService.getTagsByArticleId(id);


        //评论
        List<CommentDTO> commentList = comService.getCommentlist(id);

        //统计文章评论数
        Integer allCount = comService.getAllCount(id);

        System.out.println("评论内容" + commentList);
        //文章内容，md转换为html
        String content = MarkdownToHtmlConverter.convertMarkdownToHtml(detail.getContent());

        //点赞信息
        Integer likeCount = likeService.countArticle(id);

        //作者信息
        String username = userInfoService.getUsername(article.getUserId());

        articleDTO.setArticleList(article);
        articleDTO.setAuthor(username);
        articleDTO.setCategoryName(nameById.getCategoryName());

        model.addAttribute("singleArt", article)
                .addAttribute("categoryById", nameById)
                .addAttribute("tags", tagsByArticleId)
                .addAttribute("singleDetail", detail)
                .addAttribute("content", content)
                .addAttribute("commentList", commentList)
                .addAttribute("commentCount",allCount)
                .addAttribute("likeCount",likeCount);

        log.info("is have data:" + id + "前是id，后是数据：" + article);
        return articleDTO;
    };

    /**
     * 删除文章，首先查找文章相关绑定的内容、点赞、评论等记录，其余如作者，类型，标签等不删除
     */
    //开启事务

    public boolean removeArticle(Long id) {
        //主体
        LambdaQueryWrapper<Article> artlqw=new LambdaQueryWrapper<>();
        artlqw.eq(Article::getId,id);
        this.remove(artlqw);
        //内容
        LambdaQueryWrapper<ArticleDetail> de=new LambdaQueryWrapper<>();
        de.eq(ArticleDetail::getArticleId,id);
        articleDetail.remove(de);
        //点赞
        LambdaQueryWrapper<Like> lk=new LambdaQueryWrapper<>();
        lk.eq(Like::getOperationObj,id);
        likeService.remove(lk);
        //评论
        LambdaQueryWrapper<Comment> commentlqw=new LambdaQueryWrapper<>();
        commentlqw.eq(Comment::getArticleId,id);
        boolean remove = commentService.remove(commentlqw);

        return remove;
    }
}
