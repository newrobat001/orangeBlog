//package com.orangeBlog;
//
//import com.baomidou.mybatisplus.generator.FastAutoGenerator;
//import com.baomidou.mybatisplus.generator.config.OutputFile;
//import com.baomidou.mybatisplus.generator.config.rules.DateType;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.Collections;
//
///**
// * @author 代码生成器
// * @create 2022/1/6 17:04
// */
//@Slf4j
//@SpringBootTest(classes = OrangeBlogApplication.class, webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
//public class MPGenerator {
//
//        @Value("${spring.datasource.url}")
//        private String url;
//        @Value("${spring.datasource.username}")
//        private String username;
//        @Value("${spring.datasource.password}")
//        private String password;
//
//        private final String OUTPUTPATH = System.getProperty("user.dir") + "\\src\\main\\java";
//        private final String XMLOUTPUTPATH = System.getProperty("user.dir") + "\\src\\main\\resources\\mappers\\";
//
//        @Test
//        public void generator ()
//        {
//            System.out.println("输出目录为: " + OUTPUTPATH);
//            FastAutoGenerator
//                    //数据库配置
//                    .create(url, username, password)
//                    //全局配置
//                    .globalConfig(builder -> {
//                        builder.author("cdd")
//                                //输出日期的格式
//                                .commentDate("yyyy年MM月dd日")
//                                //使用localDateTime
//                                .dateType(DateType.TIME_PACK)
//                                //可以覆盖已经生成的文件，默认为false
////                                .fileOverride()
//                                //禁止打开输出目录
//                                .disableOpenDir()
//                                //指定输出目录
//                                .outputDir(OUTPUTPATH)
//                                .build();
//                    })
//                    //包配置
//                    .packageConfig(builder -> {
//                        //父包名
//                        builder.parent("com.orangeBlog")
//                                //默认无
//                                //.moduleName()
//                                //设置实体类包名
//                                .entity("entity")
//                                .service("service")
//                                .serviceImpl("serviceImpl")
//                                .controller("controller")
//                                .mapper("mapper")
//                                .xml("mapper.xml")
//                                //设置mapper.xml文件的输出路径
//                                .pathInfo(Collections.singletonMap( OutputFile.mapperXml, XMLOUTPUTPATH) )
//                                .build();
//                    })
//                    //策略配置
//                    .strategyConfig(builder -> {
//                        //设置要映射的表
//                        /**
//                         * "article",
//                         *                                         "article_detail",
//                         *                                         "article_tag",
//                         *                                         "category",
//                         *                                         "comment",
//                         *                                         "like",
//                         *                                         "tag",
//                         *                                         "user_foot",
//                         *                                         "user_info"
//                         */
//                        builder.addInclude("category","like")
//                                .build()
//                                //实体类配置
//                                .entityBuilder()
//                                //开启链式模式
//                                .enableChainModel()
//                                //开启lombok注解
//                                .enableLombok();
//                    })
//                    //模板配置---不输出controller层
//                    .templateConfig(builder -> {
////                        builder.disable(TemplateType.CONTROLLER);
//                    })
//                    .execute();
//        }
//}
//
