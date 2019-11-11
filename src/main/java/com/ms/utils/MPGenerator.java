package com.ms.utils;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname： Generator
 * @Description：MybatisPlus的代码生成器
 * @Author： xiedong
 * @Date： 2019/11/5 10:06
 * @Version： 1.0
 **/
public class MPGenerator
{
    //代码生成器
    private static AutoGenerator mpg = new AutoGenerator();

    //全局配置
    private static  GlobalConfig gc = new GlobalConfig();

    //作者、包名、去除表前缀
    private static final String author = "xiedong";
    private static final String package_name = "com.ms";
    private static final String TABLE_PREFIX = "sys_";

    //数据库
    private static final String url = "jdbc:mysql://yourIP:3306/ms?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=UTC";
    private static final String driverName = "com.mysql.cj.jdbc.Driver";
    private static final String userName = "root";
    private static final String password = "root";
    private static final String table_name = "sys_pepole";//单词品写错了。



    public static void main(String[] args){

        // 数据源配置
        setDataSource();

        // 全局配置
        setGlobalConfig();

        // 策略配置
        setStrategy();

        //执行
        mpg.execute();
    }

    private static void setStrategy() {
        StrategyConfig strategy = new StrategyConfig();

        // 类名：Tb_userController -> TbUserController
        strategy.setNaming(NamingStrategy.underline_to_camel);
        // 属性名：start_time -> startTime
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        // lombok 代替 setter/getter等方法
        strategy.setEntityLombokModel(true);
        // 设置Controller为RestController
        strategy.setRestControllerStyle(true);
        //由数据库该表生成
        strategy.setInclude(table_name);
        //去除表前缀
        strategy.setTablePrefix(TABLE_PREFIX);
        mpg.setStrategy(strategy);
    }

    private static void setGlobalConfig() {
        URL urlPath = Thread.currentThread().getContextClassLoader().getResource("");
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/src/main/java");//代码生成位置
        gc.setFileOverride(true);//覆盖已有文件
        gc.setAuthor(author);
        gc.setSwagger2(false);
        gc.setIdType(IdType.AUTO);//主键ID类型
        gc.setDateType(DateType.ONLY_DATE);//设置时间类型为Date
        mpg.setGlobalConfig(gc);
        PackageConfig pc = new PackageConfig();// 包配置
        pc.setParent(package_name);
        mpg.setPackageInfo(pc);
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        };
        List<FileOutConfig> focList = new ArrayList<FileOutConfig>();
        // 调整 xml 生成目录演示
        focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return projectPath + "/src/main/resources/mapper/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();

        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        // templateConfig.setEntity("templates/entity2.java");
        // templateConfig.setService();
        // templateConfig.setController();

        templateConfig.setXml(null);
        mpg.setTemplate(templateConfig);
    }

    private static void setDataSource() {
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(url);
        dsc.setDriverName(driverName);
        dsc.setUsername(userName);
        dsc.setPassword(password);
        mpg.setDataSource(dsc);
    }

}
