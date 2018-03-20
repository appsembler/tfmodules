# video_bucket

Creates an S3 bucket, Cloudfront Distribution, and IAM user suitable
for serving streaming video.

## Example

```
module "video_bucket" {
  source = "github.com/appsembler/tfmodules//video_bucket"
  name = "${terraform.workspace}-example"
}
output "access_key" {
  value = "${module.video_bucket.access_key}"
}

output "secret_key" {
  value = "${module.video_bucket.secret_key}"
}

output "bucket" {
  value = "${module.video_bucket.s3_bucket}"
}

output "cloudfront" {
  value = "${module.video_bucket.cloudfront}"
}
```

Running `terraform apply` results in output like:

```
video_bucket-access_key = AKIAI37SSEC5TED26RSQ
video_bucket-secret_key = *******************
video_bucket-bucket = appsembler-default-example-video
video_bucket-cloudfront = d3tv6zw86uqlhs.cloudfront.net
```

## Variables

* `name` - name of the bucket.
* `prefix` - defaults to "appsembler". S3 requires globally unique
  bucket names. We prepend this to the bucket name to guarantee that
  (assuming we are the only ones using "appsembler-")
* `price_class` - defaults to "PriceClass_200". CloudFront pricing
  level. Essentially determines how global network edge coverage is
  provided. See: https://aws.amazon.com/cloudfront/pricing/

## Outputs

* `access_key`, and `secret_key` - AWS credentials for an IAM user
that has read/write permissions on the bucket.
* `bucket` - the bucket name
* `cloudfront` - cloudfront hostname. Files in the bucket will be
  accessible at `https://<cloudfront>/path/to/file`. Be aware that it
  takes AWS ten minutes or so to fully enable a cloudfront
  distribution the first time it creates it. So if you terraform and
  then immediately try to access it, it won't work. Just wait a bit.
