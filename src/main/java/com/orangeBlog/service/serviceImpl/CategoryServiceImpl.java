package com.orangeBlog.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.orangeBlog.entity.Category;
import com.orangeBlog.mapper.CategoryMapper;
import com.orangeBlog.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 类目表，一个文章仅可拥有一个类目 服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月17日
 */
@Service
public class CategoryServiceImpl
        extends ServiceImpl<CategoryMapper, Category>
        implements ICategoryService {
    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<Category> getAllCategoryNames() {
        return categoryMapper.getAllCategoryNames();
    }

    @Override
    public Category getNameById(Long id) {
        return categoryMapper.getNameById(id);
    }

    @Override
    public String getCateName(Long id) {
        return categoryMapper.getCateName(id);
    }

    @Override
    public Integer getCOUNT(Long id) {
        return categoryMapper.getCOUNT(id);
    }
}
