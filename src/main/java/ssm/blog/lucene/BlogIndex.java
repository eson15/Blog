package ssm.blog.lucene;

import java.nio.file.Paths;
import java.util.Date;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import ssm.blog.entity.Blog;
import ssm.blog.util.DateUtil;

/**
 * @Description 博客索引类
 * @author Ni Shengwu
 *
 */
public class BlogIndex {

	private Directory dir;
	
	private IndexWriter getWriter() throws Exception {		
		dir = FSDirectory.open(Paths.get("D:\\blog_index"));
		SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
		IndexWriterConfig config = new IndexWriterConfig(analyzer);
		IndexWriter writer = new IndexWriter(dir, config);	
		return writer;
	}
	
	//添加博客索引
	public void addIndex(Blog blog)  throws Exception {
		IndexWriter writer = getWriter();
		Document doc = new Document();
		doc.add(new StringField("id", String.valueOf(blog.getId()), Field.Store.YES));
		doc.add(new TextField("title", blog.getTitle(), Field.Store.YES));
		doc.add(new StringField("realeseDate", DateUtil.formatDate(new Date(), "yyyy-MM-dd"), Field.Store.YES));		
		doc.add(new TextField("content", blog.getContentNoTag(), Field.Store.YES));		
		writer.addDocument(doc);
		writer.close();
	}
}
