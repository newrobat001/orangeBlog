package com.orangeBlog.mapper;

import com.orangeBlog.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 类目表，一个文章仅可拥有一个类目 Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface CategoryMapper extends BaseMapper<Category> {
    List<Category> getAllCategoryNames();
    List<Category> getAllCategory();
    Category getNameById(Long id);
    String getCateName(Long id);
    Integer getCOUNT(Long id);
}
